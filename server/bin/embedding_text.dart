import 'dart:convert';
import 'dart:io';

import 'package:chromadb/chromadb.dart';
import 'package:server/v0/data/openai.dart';

void main() async {
  final apiKeys = json //
      .decode(File('env/production.json').readAsStringSync())['OPENAI_API_KEYS']
      .cast<String>();
  final embeddingFunction = OpenAIEmbedding(apiKeys);
  print(
    (await embeddingFunction.generate([
      // Embeddable.document('QUẢN LÝ MỸ PHẨM'),
      Embeddable.document('Những lưu ý khi đi nghĩa vụ quân sự')
    ])).first,
  );
}
