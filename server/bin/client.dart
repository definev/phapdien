import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

void main() async {
  final response = await http.get(
    Uri.parse('http://localhost:7777/v0/phapdien/demuc_content?id=55323c64-e78f-4537-afcd-6a3c2af3c71d'),
  );
  final document = parser.parse(response.body);
  final pNotes = document.querySelectorAll('.pGhiChu');
  for (final note in pNotes) {
    var sib = note.nextElementSibling;
    print('start: ${note.text}');
    final aTag = note.querySelector('a');
    final link = aTag?.attributes['href'];
    if (link != null) {
      final linkUri = Uri.parse(link);
      print('link: $link');
      linkUri.queryParameters.forEach((key, value) {
        print('     $key: $value');
      });
    }
    while (sib != null) {
      final text = sib.text.trim();
      if (text.isNotEmpty) print('    $text');
      sib = sib.nextElementSibling;
      if (sib == null) break;
      if (sib.className == 'pGhiChu') break;
    }
    print('end');
  }
}
