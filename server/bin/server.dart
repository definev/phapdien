import 'dart:async';

import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

void main(List<String> args) async {
  // // Use any available host or container IP (usually `0.0.0.0`).
  // final ip = InternetAddress.anyIPv4;

  // // Configure a pipeline that logs requests.
  // final handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // // For running in containers, we respect the PORT environment variable.
  // final port = int.parse(Platform.environment['PORT'] ?? '8080');
  // final server = await serve(handler, ip, port);
  // print('Server listening on port ${server.port}');

  final promptTemplate1 = ChatPromptTemplate.fromTemplate(
    'What is the city {person} is from? Only respond with the name of the city.',
  );
  final promptTemplate2 = ChatPromptTemplate.fromTemplate(
    'What country is the city {city} in? Respond in {language}.',
  );

  final model = ChatOpenAI(apiKey: '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');
  const stringOutputParser = StringOutputParser();

  final chain = Runnable.fromMap({
        'city': promptTemplate1 | model | stringOutputParser,
        'language': Runnable.getItemFromMap('language'),
      }) |
      promptTemplate2 |
      model |
      stringOutputParser;

  final res = chain.stream({
    'person': 'Rafael Nadal',
    'language': 'Spanish',
  });
  res.transform<String>(StreamTransformer.fromHandlers(handleData: (event, sink) {
    sink.add(event as String);
  }));
  res.listen((event) {
    print('runtimeType: ${event.runtimeType}');
    print(event);
  });
}
