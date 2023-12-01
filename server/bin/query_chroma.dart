import 'package:server/v0/data/chroma.dart';
import 'package:server/v0/data/openai.dart';
import 'package:server/v0/data/provider_container.dart';

void main() async {
  final chromaClient = providerContainer.read(chromaClientProvider);
  final collection = await chromaClient.getCollection(
    name: 'phapdien',
    embeddingFunction: OpenAIEmbedding(),
  );
  final result = await collection.query(queryTexts: ['Trách nhiệm của Ủy ban nhân dân các cấp']);
  for (final data in result.data ?? <List<String>>[]) {
    print(data.join('\n'));
  }
}
