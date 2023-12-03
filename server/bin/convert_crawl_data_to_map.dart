import 'dart:convert';
import 'dart:io';

import 'package:server/v0/domain/vbpl_content.dart';

void main() {
  final dir = Directory('crawl_data/mapped');
  dir.createSync(recursive: true);
  final idsFile = File('crawl_data/concrete_ids.json');
  final ids = (json.decode(idsFile.readAsStringSync()) as List<dynamic>).cast<String>();
  if (ids.isEmpty) {
    print('no ids to map');
    return;
  }
  for (final id in ids) {
    final file = File('crawl_data/raw/$id.json');
    final content = file.readAsStringSync();
    final jsonContent = json.decode(content) as List<dynamic>;
    final vbplContents = jsonContent.map((e) => VBPLContent.fromJson(e as Map<String, dynamic>)).toList();
    final map = {
      for (final vbplContent in vbplContents) vbplContent.embeddableId: vbplContent.toJson(),
    };
    final mappedFile = File('crawl_data/mapped/$id.json');
    mappedFile.writeAsStringSync(json.encode(map));
  }
}
