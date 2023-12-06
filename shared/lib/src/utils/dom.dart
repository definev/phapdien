import 'package:html/dom.dart' as dom;

class DomUtils {
  static String tableToCsv(dom.Element table) {
    List<String> rowData = [];

    // Iterate over each row in the table
    for (var row in table.children) {
      // Iterate over each cell in the row
      for (var cell in row.children) {
        // Add cell value to CSV, escaping if necessary
        rowData.add(cell.text.escapeCsvValue());
      }
    }

    return '\n${rowData.join('\n')}\n';
  }
}

extension on String {
  String escapeCsvValue() {
    final value = trim();
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
}
