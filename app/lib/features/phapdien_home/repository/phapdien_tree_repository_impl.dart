import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'phapdien_tree_repository.dart';

class PhapdienTreeRepositoryImpl extends PhapdienTreeRepository {
  // TODO add your methods here
}

final phapdienTreeRepositoryProvider = Provider<PhapdienTreeRepository>((ref) {
  return PhapdienTreeRepositoryImpl();
});
