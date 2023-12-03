import 'package:server/v0/apllications/phapdien/get_search.dart';
import 'package:server/v0/data/provider_container.dart';
import 'package:server/v0/domain/get_phapdien_search_request.dart';
import 'package:shelf/shelf.dart';

Future<Response> getPhapdienSearchHandler(Request request) async {
  final GetPhapdienSearchRequest entity;
  try {
    entity = GetPhapdienSearchRequest.fromJson(request.url.queryParameters);
  } catch (e) {
    return Response(400, body: 'Invalid request');
  }

  final controller = providerContainer.read(getPhapdienSearchControllerProvider);
  final result = await controller.searchByQuery(entity.query, entity.count);
  return Response.ok(
    result.map((e) => e.toJson()).toList(),
    headers: {'Content-Type': 'application/json'},
  );
}
