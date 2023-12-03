import 'package:chromadb/chromadb.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:server/v0/apllications/vector_database/embedding_function/embedding_function.dart';
import 'package:server/v0/data/phapdien_db/phapdien_db.dart';
import 'package:server/v0/data/vector_database.dart';
import 'package:server/v0/domain/vbpl_content.dart';

part 'get_search.g.dart';

@riverpod
GetPhapdienSearchController getPhapdienSearchController(GetPhapdienSearchControllerRef ref) {
  return ImplGetPhapdienSearchController(ref);
}

abstract class GetPhapdienSearchController {
  Future<List<VBPLContent>> searchByQuery(String query, int count);
}

class ImplGetPhapdienSearchController implements GetPhapdienSearchController {
  const ImplGetPhapdienSearchController(this.ref);

  final Ref ref;

  @override
  Future<List<VBPLContent>> searchByQuery(String query, int count) async {
    final db = ref.read(phapdienDBProvider);

    final embeddingFunction = ref.read(embeddingFunctionProvider);
    final vector = await embeddingFunction.generate([EmbeddableDocument(document: query)]);
    final client = ref.watch(vectorDatabaseProvider);
    final raw = await client.searchVector(
      vector: vector.first,
      count: count,
    );
    final ids = raw.map((e) => (e['demuc_id'], e['id'])).toList();
    final result = <VBPLContent>[];
    for (final id in ids) {
      final content = await db.getVbplContentById(id.$1, id.$2);
      if (content != null) result.add(content);
    }
    return result;
  }
}
