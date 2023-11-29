import 'dart:async';

import 'package:shelf/shelf.dart';

FutureOr<Response> getDemucContentHandler(Request req) async {
  return Response.ok('pong');
}
