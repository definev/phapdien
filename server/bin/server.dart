import 'dart:io';

import 'package:server/api_docs/swagger.dart';
import 'package:server/v0/routes/chat/get_random_question.dart';
import 'package:server/v0/routes/chat/post_ask.dart';
import 'package:server/v0/routes/chat/post_stream_ask.dart';
import 'package:server/v0/routes/phapdien/get_children.dart';
import 'package:server/v0/routes/phapdien/get_demuc_content.dart';
import 'package:server/v0/routes/phapdien/get_root.dart';
import 'package:server/v0/routes/phapdien/get_search.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_cors_headers/shelf_cors_headers.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';

// Configure routes.
final _router = Router()
  ..get('/ping', _pingHandler)
  ..get('/v0/phapdien/root', getPhapdienRootNodesHandler)
  ..get('/v0/phapdien/children', getPhapdienChildrenNodesHandler)
  ..get('/v0/phapdien/demuc_content', getPhapdienDemucContentHandler)
  ..get('/v0/phapdien/search', getPhapdienSearchHandler)
  ..post('/v0/chat/ask', askHandler)
  ..post('/v0/chat/stream_ask', streamAskHandler)
  ..get('/v0/chat/rand_questions', getRandQuestionsHandler);

// A handler that responds to `/ping` requests.
Response _pingHandler(Request request) => Response.ok('pong');

void main() => serveServer();

Future<HttpServer> serveServer() async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline() //
      .addMiddleware(corsHeaders())
      .addMiddleware(logRequests())
      .addHandler((Cascade() //
              .add(_router)
              .add(createStaticHandler('./specs'))
              .add(swaggerUIHandler))
          .handler);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '7777');
  final server = await shelf_io.serve(handler, ip, port);
  return server;
}
