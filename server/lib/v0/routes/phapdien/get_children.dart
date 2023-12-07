import 'dart:convert';

import 'package:server/v0/apllications/phapdien_crawler.dart';
import 'package:server/v0/data/provider_container.dart';
import 'package:server/v0/domain/phapdien_children_request.dart';
import 'package:shelf/shelf.dart';

Future<Response> getPhapdienChildrenNodesHandler(Request req) async {
  try {
    final PhapdienChildrenRequest entity;
    try {
      entity = PhapdienChildrenRequest.fromJson(req.url.queryParameters);
    } catch (error) {
      return Response.badRequest(body: 'Invalid request: ${error.toString()}');
    }

    final crawler = providerContainer.read(phapdienCrawlerProvider);
    final nodes = await crawler.getChildrenNodesById(entity.id, entity.level);

    return Response.ok(
      json.encode(nodes.map((e) => e.toJson()).toList()),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, DELETE, OPTIONS',
        'Access-Control-Allow-Headers': 'Origin, Content-Type',
      },
    );
  } catch (error) {
    return Response.internalServerError(body: 'Internal server error: ${error.toString()}');
  }
}
