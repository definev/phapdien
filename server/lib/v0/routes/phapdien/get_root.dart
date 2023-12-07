import 'dart:convert';

import 'package:server/v0/apllications/phapdien_crawler.dart';
import 'package:server/v0/data/provider_container.dart';
import 'package:server/v0/domain/phapdien_node.dart';
import 'package:shelf/shelf.dart';

Future<Response> getPhapdienRootNodesHandler(Request req) async {
  final crawler = providerContainer.read(phapdienCrawlerProvider);
  final response = await crawler.getRootNodes();

  return Response.ok(
    json.encode(response.toJson()),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Access-Control-Allow-Origin': '*',
    },
  );
}
