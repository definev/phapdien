import 'package:json_annotation/json_annotation.dart';
import 'package:shelf/shelf.dart';

part 'get.g.dart';

@JsonSerializable()
class GetPhapdienRequest {
  const GetPhapdienRequest({required this.id});
  factory GetPhapdienRequest.fromJson(Map<String, dynamic> json) => _$GetPhapdienRequestFromJson(json);

  final String id;

  Map<String, dynamic> toJson() => _$GetPhapdienRequestToJson(this);
}

Future<Response> getPhapdienHandler(Request req) async {
  final GetPhapdienRequest entity;
  try {
    entity = GetPhapdienRequest.fromJson(req.url.queryParameters);
  } catch (error) {
    return Response.badRequest(body: 'Invalid request: ${error.toString()}');
  }
  return Response.ok('Phap dien ${entity.id}');
}
