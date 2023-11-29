import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:server/v0/domain/phapdien_node.dart';

import 'web_crawler/web_phapdien_crawler.dart';

part 'phapdien_crawler.g.dart';

@riverpod
PhapdienCrawler phapdienCrawler(PhapdienCrawlerRef ref) {
  return WebPhapDienCrawler();
}

abstract class PhapdienCrawler {
  Future<String?> getDemucContentById(String id);

  Future<List<PhapdienNode>> getRootNodes();

  Future<List<PhapdienNode>> getChildrenNodes(PhapdienNode node);

  Future<List<PhapdienNode>> getChildrenNodesById(String id, int level);
}
