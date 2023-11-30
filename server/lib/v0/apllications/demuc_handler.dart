import 'dart:convert';

import 'package:html/dom.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:server/utils/dom.dart';
import 'package:server/v0/domain/vbpl_content.dart';

void main() async {
  final demucId = '0cf69ad9-6f29-4ee4-8e16-2c3aa65c3a52';
  final response =
      await http.get(Uri.parse('http://localhost:7777/v0/phapdien/demuc_content?id=$demucId&show_raw=true'));
  final contents = await convertVBPLHtmlToVBPLContents(demucId, response.body);

  JsonEncoder.withIndent('  ').convert(contents.map((e) => e.toJson()).toList()).split('\n').forEach(print);
}

String _getDemucTitle(String raw) {
  return (raw //
          .trim()
          .split('\n')
          .map((s) => s.trim())
          .toList()
        ..remove(''))
      .join(': ');
}

typedef ChuongElement = ({String chuongId, String chuongTitle});
ChuongElement? _processChuongElement({required Element dieu}) {
  var prev = dieu.previousElementSibling;
  if (prev?.className == 'pChuong') {
    var chuongTitle = prev?.text.trim() ?? '';
    prev = prev?.previousElementSibling;
    final aTag = prev?.querySelector('a');
    final chuongId = aTag?.attributes['name'] ?? '';
    chuongTitle = '${prev?.text}: $chuongTitle';
    return (chuongId: chuongId, chuongTitle: chuongTitle);
  }
  return null;
}

typedef GhichuElement = ({
  String itemId,
  String locationInVbpl,
  String sourceTitle,
  String sourceUrl,
});
(Element?, GhichuElement) _processGhiChuElement({required Element dieu}) {
  var (:itemId, :locationInVbpl, :sourceTitle, :sourceUrl) = (
    itemId: '',
    locationInVbpl: '',
    sourceTitle: '',
    sourceUrl: '',
  );
  var sib = dieu.nextElementSibling;
  if (sib?.className == 'pGhiChu') {
    final aTag = sib?.querySelector('a');
    final link = aTag?.attributes['href'];
    if (link != null) {
      final linkUri = Uri.parse(link);
      itemId = linkUri.queryParameters['ItemID'] ?? '';
      locationInVbpl = linkUri.fragment;
    }
    sourceTitle = sib?.text.trim() ?? '';
    sourceUrl = link ?? '';
    sib = sib?.nextElementSibling;
  }

  return (sib, (itemId: itemId, locationInVbpl: locationInVbpl, sourceTitle: sourceTitle, sourceUrl: sourceUrl));
}

Future<List<VBPLContent>> convertVBPLHtmlToVBPLContents(String demucId, String raw) async {
  List<VBPLContent> contents = [];

  final document = parser.parse(raw);

  final h3DemucTitle = document.querySelector('h3');
  final demucTitle = _getDemucTitle(h3DemucTitle?.text ?? '');
  ChuongElement? chuongElement;

  final pDieus = document.querySelectorAll('.pDieu');
  for (final dieu in pDieus) {
    var content = VBPLContent(
      title: dieu.text.trim(),
      content: '',
      sourceTitle: '',
      sourceUrl: '',
      itemId: '',
      locationInVbpl: '',
      demucId: demucId,
      demucTitle: demucTitle,
      chuongId: '',
      chuongTitle: '',
    );

    chuongElement = _processChuongElement(dieu: dieu) ?? chuongElement;
    var (sib, ghichuElement) = _processGhiChuElement(dieu: dieu);
    content = content.copyWith(
      itemId: ghichuElement.itemId,
      locationInVbpl: ghichuElement.locationInVbpl,
      sourceTitle: ghichuElement.sourceTitle,
      sourceUrl: ghichuElement.sourceUrl,
    );

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
      if (sib?.className == 'pDieu') break;
    }

    content = content.copyWith(
      content: contentBuffer.toString().trim(),
      chuongId: chuongElement?.chuongId ?? '',
      chuongTitle: chuongElement?.chuongTitle ?? '',
    );
    contents.add(content);
  }

  return contents;
}
