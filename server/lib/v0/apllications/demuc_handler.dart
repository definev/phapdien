import 'package:html/parser.dart' as parser;
import 'package:server/utils/dom.dart';
import 'package:server/v0/domain/vbpl_content.dart';

Future<List<VBPLContent>> convertVBPLHtmlToVBPLContents(String raw) async {
  List<VBPLContent> contents = [];

  final document = parser.parse(raw);
  final pDieus = document.querySelectorAll('.pDieu');
  for (final dieu in pDieus) {
    var content = VBPLContent(
      title: dieu.text.trim(),
      content: '',
      sourceTitle: '',
      sourceUrl: '',
      itemId: '',
      locationInVbpl: '',
    );

    var sib = dieu.nextElementSibling;
    if (sib?.className == 'pGhiChu') {
      final aTag = sib?.querySelector('a');
      final link = aTag?.attributes['href'];
      if (link != null) {
        final linkUri = Uri.parse(link);
        content = content.copyWith(
          itemId: linkUri.queryParameters['ItemID'] ?? '',
          locationInVbpl: linkUri.fragment,
        );
      }
      content = content.copyWith(
        sourceTitle: sib?.text.trim() ?? '',
        sourceUrl: link ?? '',
      );
      sib = sib?.nextElementSibling;
    }

    StringBuffer contentBuffer = StringBuffer();

    while (sib != null) {
      String text;
      switch (sib.localName) {
        case 'table':
          text = DomUtils.tableToCsv(sib);
        default:
          text = sib.text.trim();
      }

      contentBuffer.writeln(text);

      sib = sib.nextElementSibling;
      if (sib == null) break;
      if (sib.className == 'pDieu') break;
    }

    content = content.copyWith(content: contentBuffer.toString());
    contents.add(content);
  }

  return contents;
}
