import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:server/v0/domain/phapdien_node.dart';

void main() async {
  await crawlingData();
}

Future<void> crawlingData() async {
  const sourceUrl = 'http://localhost:7777';

  final demucContent = await http.get(Uri.parse('$sourceUrl/v0/phapdien/root'));

  final list = json.decode(demucContent.body) as List<dynamic>;
  final phapdienNodes = list //
      .map((l) => PhapdienNode.fromJson(l))
      .toList()
    ..removeWhere((node) => node.type is! DeMucPhapdienNodeType);

  List<String> ids = [];

  for (final node in phapdienNodes) {
    ids.add(node.id);
    File file = File('crawl_data/raw/${node.id}.json');
    final content = await http.get(Uri.parse('$sourceUrl/v0/phapdien/demuc_content?id=${node.id}'));
    await file.writeAsString(content.body);
  }

  File file = File('crawl_data/ids.json');
  await file.writeAsString(json.encode(ids));
  file = File('crawl_data/concrete_ids.json');
  await file.writeAsString(json.encode(ids));
}
