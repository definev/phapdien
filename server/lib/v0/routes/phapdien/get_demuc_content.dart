import 'dart:async';

import 'package:server/v0/apllications/phapdien_crawler.dart';
import 'package:server/v0/data/provider_container.dart';
import 'package:server/v0/domain/phapdien_demuc_content_request.dart';
import 'package:shelf/shelf.dart';

FutureOr<Response> getPhapdienDemucContentHandler(Request req) async {
  final PhapdienDemucContentRequest entity;
  try {
    entity = PhapdienDemucContentRequest.fromJson(req.url.queryParameters);
  } catch (error) {
    return Response.badRequest(body: 'Invalid request: ${error.toString()}');
  }

  final crawler = providerContainer.read(phapdienCrawlerProvider);
  final content = await crawler.getDemucContentById(entity.id);
  if (content == null) return Response.notFound('Not found');

  return Response.ok(
    content,
    headers: {'Content-Type': 'text/html; charset=utf-8'},
  );
}
