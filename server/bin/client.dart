import 'dart:convert';

import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:server/v0/domain/phapdien_node_content.dart';

void main() async {
  List<VBPLContent> contents = [];

  final response = await http.get(
    Uri.parse('http://localhost:7777/v0/phapdien/demuc_content?id=55323c64-e78f-4537-afcd-6a3c2af3c71d'),
  );
  final document = parser.parse(response.body);
  final pDieus = document.querySelectorAll('.pDieu');
  for (final dieu in pDieus) {
    VBPLContent content = VBPLContent(
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
          text = tableToCsv(sib);
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

  print(JsonEncoder.withIndent('  ').convert(contents));
}

String tableToCsv(dom.Element table) {
  List<String> rowData = [];

  // Iterate over each row in the table
  for (var row in table.children) {
    // Iterate over each cell in the row
    for (var cell in row.children) {
      // Add cell value to CSV, escaping if necessary
      rowData.add(escapeCsvValue(cell.text));
    }
  }

  return rowData.join('\n');
}

String escapeCsvValue(String value) {
  // If the value contains a double quote, escape it by doubling it

  value = value.trim();
  var raw = value.split('\n').map((e) => e.trim()).toList();
  var result = raw.reduce((value, element) =>
      value +
      switch (element) {
        '' => '',
        final value => ', $value',
      });

  if (result.contains('"')) result = result.replaceAll('"', '');
  return result;
}
