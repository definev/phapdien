import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/shared.dart';

import 'file/file_phapdien_db.dart';

part 'phapdien_db.g.dart';

@Riverpod(keepAlive: true)
PhapdienDB phapdienDB(PhapdienDBRef ref) {
  return ref.watch(filePhapdienDBProvider);
}

abstract class PhapdienDB {
  Future<List<VBPLContent>> getVbplContentByDemucId(String demucId);

  Future<VBPLContent?> getVbplContentById(String demucId, String id);
}
