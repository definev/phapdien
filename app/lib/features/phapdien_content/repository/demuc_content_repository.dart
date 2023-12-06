import 'package:app/features/phapdien_content/repository/rest/demuc_content_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/shared.dart';

part 'demuc_content_repository.g.dart';

@riverpod
DemucContentRepository demucContentRepository(DemucContentRepositoryRef ref) {
  return ref.watch(restDemucContentRepositoryProvider);
}

abstract class DemucContentRepository {
  Future<String> getDemucContent(String id);

  Future<List<VBPLContent>> getDemucContentVbpl(String id);
}
