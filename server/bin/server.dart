import 'dart:io';

import 'package:server/v0/api_docs/swagger.dart';
import 'package:server/v0/routes/phapdien/get_phapdien_root_nodes.dart';
import 'package:server/v0/routes/phapdien/post_phapdien_children_nodes.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';

// Configure routes.
final _router = Router()
  ..get('/ping', _pingHandler)
  ..get('/v0/phapdien/root', getPhapdienRootNodesHandler)
  ..post('/v0/phapdien/children', postPhapdienChildrenNodesHandler);

// A handler that responds to `/ping` requests.
Response _pingHandler(Request request) => Response.ok('pong');

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline() //
      .addMiddleware(logRequests())
      .addHandler((Cascade() //
              .add(createStaticHandler('specs'))
              .add(_router)
              .add(swaggerUIHandler))
          .handler);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '7777');
  final server = await shelf_io.serve(handler, ip, port);
  print('Server listening on port ${server.port}');
}
