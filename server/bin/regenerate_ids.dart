import 'dart:convert';
import 'dart:io';

void main() {
  final dir = Directory('crawl_data');
  final entities = dir.listSync();
  final ids = <String>[];
  for (final entity in entities.whereType<File>()) {
    final idName = entity.uri.pathSegments.last;
    if (idName == 'ids.json') continue;
    ids.add(idName.split('.').first);
  }
  File('crawl_data/ids.json').writeAsStringSync(json.encode(ids));
  File('crawl_data/concrete_ids.json').writeAsStringSync(json.encode(ids));
}
