import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:server/v0/apllications/phapdien_crawler.dart';
import 'package:server/v0/data/provider_container.dart';
import 'package:shelf/shelf.dart';

part 'post_phapdien_children_nodes.g.dart';

@JsonSerializable()
class PostPhapdienChildrenNodesRequest {
  const PostPhapdienChildrenNodesRequest({required this.id, required this.level});
  factory PostPhapdienChildrenNodesRequest.fromJson(Map<String, dynamic> json) =>
      _$PostPhapdienChildrenNodesRequestFromJson(json);

  final String id;
  final int level;

  Map<String, dynamic> toJson() => _$PostPhapdienChildrenNodesRequestToJson(this);
}

Future<Response> postPhapdienChildrenNodesHandler(Request req) async {
  try {
    final PostPhapdienChildrenNodesRequest entity;
    try {
      entity = PostPhapdienChildrenNodesRequest.fromJson(json.decode(await req.readAsString()));
    } catch (error) {
      return Response.badRequest(body: 'Invalid request: ${error.toString()}');
    }

    final crawler = providerContainer.read(phapdienCrawlerProvider);
    final nodes = await crawler.getPhapdienChildrenNodesById(entity.id, entity.level);

    return Response.ok(
      json.encode(nodes.map((e) => e.toJson()).toList()),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );
  } catch (error) {
    return Response.internalServerError(body: 'Internal server error: ${error.toString()}');
  }
}
