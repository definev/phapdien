import 'dart:convert';
import 'dart:io';

import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:server/v0/data/phapdien_db/phapdien_db.dart';
import 'package:server/v0/domain/vbpl_content.dart';

part 'file_phapdien_db.g.dart';

@Riverpod(keepAlive: true)
Future<Map<String, dynamic>> demucContentMap(DemucContentMapRef ref, String demucId) async {
  final file = File('crawl_data/mapped/$demucId.json');
  var raw = await file.readAsString();
  if (raw.isEmpty) raw = '{}';

  return json.decode(raw) as Map<String, dynamic>;
}

@Riverpod(keepAlive: true)
PhapdienDB filePhapdienDB(FilePhapdienDBRef ref) {
  return FilePhapdienDB(ref);
}

class FilePhapdienDB implements PhapdienDB {
  FilePhapdienDB(this.ref);

  final Ref ref;

  @override
  Future<List<VBPLContent>> getVbplContentByDemucId(String demucId) async {
    final map = await ref.watch(demucContentMapProvider(demucId).future);
    return map.values.map((e) => VBPLContent.fromJson(e)).toList();
  }

  @override
  Future<VBPLContent?> getVbplContentById(String demucId, String id) async {
    final map = await ref.watch(demucContentMapProvider(demucId).future);
    final raw = map[id];
    if (raw != null) return VBPLContent.fromJson(raw);
    return null;
  }
}
