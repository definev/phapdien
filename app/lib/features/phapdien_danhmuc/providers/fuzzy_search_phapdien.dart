import 'package:app/features/phapdien_danhmuc/providers/get_phapdien_nodes_child.dart';
import 'package:diacritic/diacritic.dart';
import 'package:fuzzy/fuzzy.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/shared.dart';

part 'fuzzy_search_phapdien.g.dart';

@riverpod
Future<List<PhapdienNode>> fuzzySearchPhapdien(FuzzySearchPhapdienRef ref, String query) async {
  final cachedNodes = ref.read(cachedPhapdienNodesProvider);
  final fuzzy = Fuzzy<PhapdienNode>(
    cachedNodes.toList(),
    options: FuzzyOptions(isCaseSensitive: false, keys: [
      WeightedKey(
        name: 'text',
        getter: (node) => removeDiacritics(node.text),
        weight: 0.5,
      ),
    ]),
  );
  final result = fuzzy.search(query);
  return result.map((e) => e.item).toList();
}
