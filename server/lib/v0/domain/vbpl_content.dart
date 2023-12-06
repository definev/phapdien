import 'package:chromadb/chromadb.dart';
import 'package:shared/shared.dart';

extension EmbeddableVBPLContent on VBPLContent {
  String get embeddableId => id;

  EmbeddableDocument get embeddableContent => EmbeddableDocument(document: '''
Đề mục: "$demucTitle"
Chương: "$chuongTitle"
Nguồn VBPL: "$sourceTitle"
Tiêu đề: "$title"
Nội dung: "${content.limit(1000)}"''');
}
