import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:server/v0/domain/phapdien_node.dart';

import 'web_crawler/web_phapdien_crawler.dart';

part 'phapdien_crawler.g.dart';

@riverpod
PhapdienCrawler phapdienCrawler(PhapdienCrawlerRef ref) {
  return WebPhapDienCrawler();
}

abstract class PhapdienCrawler {
  Future<List<PhapdienNode>> getPhapdienRootNodes();

  Future<List<PhapdienNode>> getPhapdienChildrenNodes(PhapdienNode node);
}
