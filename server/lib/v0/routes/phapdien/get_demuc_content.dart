import 'dart:async';
import 'dart:convert';

import 'package:server/v0/apllications/demuc_handler.dart' as demuc_handler;
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

  return switch (true) {
    _ when entity.showRaw => Response.ok(
        content,
        headers: {'Content-Type': 'text/html; charset=utf-8'},
      ),
    _ => await () async {
        final contents = await demuc_handler.convertVBPLHtmlToVBPLContents(entity.id, content);
        return Response.ok(
          json.encode([for (final content in contents) content.toJson()]),
          headers: {
            'Content-Type': 'application/json; charset=utf-8',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Methods': 'GET, POST, DELETE, OPTIONS',
            'Access-Control-Allow-Headers': 'Origin, Content-Type',
          },
        );
      }(),
  };
}
