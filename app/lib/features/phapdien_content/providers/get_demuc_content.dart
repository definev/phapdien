import 'package:app/features/phapdien_content/repository/demuc_content_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/shared.dart';

part 'get_demuc_content.g.dart';

@riverpod
Future<String> getDemucContentHtml(
  GetDemucContentHtmlRef ref,
  PhapdienNode node,
) async {
  final repository = ref.watch(demucContentRepositoryProvider);
  final response = await repository.getDemucContent(node.id);
  return response;
}

@riverpod
Future<List<VBPLContent>> getDemucContentVbpl(
  GetDemucContentVbplRef ref,
  PhapdienNode node,
) async {
  final repository = ref.watch(demucContentRepositoryProvider);
  final response = await repository.getDemucContentVbpl(node.id);
  return response;
}
