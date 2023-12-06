import 'package:app/apis/phapdien_client.dart';
import 'package:app/features/phapdien_danhmuc/repository/phapdien_danhmuc_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/shared.dart';

part 'phapdien_danhmuc_repository.g.dart';

@riverpod
RestPhapdienDanhmucRepository restPhapdienDanhmucRepository(RestPhapdienDanhmucRepositoryRef ref) {
  final client = ref.watch(phapdienRestClientProvider);
  return RestPhapdienDanhmucRepository(client);
}

class RestPhapdienDanhmucRepository extends PhapdienDanhmucRepository {
  RestPhapdienDanhmucRepository(this.client);

  final PhapdienRestClient client;

  @override
  Future<List<PhapdienNode>> getChildrenNodes(PhapdienNode parent) async {
    return client.getChildrenNodes(parent.id, parent.type.level);
  }

  @override
  Future<List<PhapdienNode>> getRoot() async {
    return client.getRoot();
  }
}
