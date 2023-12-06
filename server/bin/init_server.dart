import 'dart:convert';
import 'dart:io';

import 'package:server/v0/routes/phapdien/get_demuc_content.dart';
import 'package:server/v0/routes/phapdien/get_root.dart';
import 'package:shared/shared.dart';
import 'package:shelf/shelf.dart';

import 'convert_crawl_data_to_map.dart' as convert_crawl_data_to_map;

void main() async {
  if (!Directory('./crawl_data').existsSync()) {
    final demucContent = await getPhapdienRootNodesHandler(
      Request(
        'GET',
        Uri.parse('http://localhost:7777/v0/phapdien/root'),
      ),
    );

    final list = json.decode(await demucContent.readAsString()) as List<dynamic>;
    final phapdienNodes = list //
        .map((l) => PhapdienNode.fromJson(l))
        .toList()
      ..removeWhere((node) => node.type is! DeMucPhapdienNodeType);

    print('Total: ${phapdienNodes.length} nodes');

    List<String> ids = [];

    for (final node in phapdienNodes) {
      print('Crawling ${node.id}...');
      ids.add(node.id);
      File file = File('crawl_data/raw/${node.id}.json');
      file.createSync(recursive: true);
      final content = await getPhapdienDemucContentHandler(
        Request(
          'GET',
          Uri.parse('http://localhost:7777/v0/phapdien/demuc_content?id=${node.id}'),
        ),
      );
      await file.writeAsString(await content.readAsString());
      print('Crawled ${node.id}');
    }

    File file = File('crawl_data/ids.json');
    await file.writeAsString(json.encode(ids));
    file = File('crawl_data/concrete_ids.json');
    await file.writeAsString(json.encode(ids));
  }

  convert_crawl_data_to_map.main();
}
