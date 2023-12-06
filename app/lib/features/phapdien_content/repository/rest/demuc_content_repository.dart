import 'package:app/apis/phapdien_client.dart';
import 'package:app/features/phapdien_content/repository/demuc_content_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/src/models/vbpl_content.dart';

part 'demuc_content_repository.g.dart';

@riverpod
DemucContentRepository restDemucContentRepository(RestDemucContentRepositoryRef ref) {
  final client = ref.watch(phapdienRestClientProvider);
  return RestDemucContentRepository(client);
}

class RestDemucContentRepository implements DemucContentRepository {
  const RestDemucContentRepository(this.client);

  final PhapdienRestClient client;

  @override
  Future<String> getDemucContent(String id) async {
    final response = await client.getDemucContent(id, true);
    return response as String;
  }

  @override
  Future<List<VBPLContent>> getDemucContentVbpl(String id) async {
    final response = await client.getDemucContent(id, false);
    final list = response as List<dynamic>;
    return list.map((e) => VBPLContent.fromJson(e as Map<String, dynamic>)).toList();
  }
}
