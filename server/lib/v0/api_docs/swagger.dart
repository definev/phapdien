import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:server/v0/data/provider_container.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_swagger_ui/shelf_swagger_ui.dart';

part 'swagger.g.dart';

@Riverpod(keepAlive: true)
SwaggerUI swaggerUI(SwaggerUIRef ref) {
  return SwaggerUI(
    './specs/swagger.yaml',
    syntaxHighlightTheme: SyntaxHighlightTheme.tomorrowNight,
    title: 'Pháp Điển API',
  );
}

FutureOr<Response> Function(Request) get swaggerUIHandler {
  final swaggerUI = providerContainer.read(swaggerUIProvider);
  return (req) {
    if (!req.url.pathSegments.join('/').contains('api_docs')) {
      return Response.notFound('Not found');
    }
    return swaggerUI(req);
  };
}
