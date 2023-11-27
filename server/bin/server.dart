import 'package:html/dom.dart';
import 'package:html/parser.dart' as html;
import 'package:http/http.dart' as http;
import 'package:server/v0/routes/phapdien/list.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler)
  ..get('/phapdien', phapDienHandler);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = request.params['message'];
  return Response.ok('$message\n');
}

// void main(List<String> args) async {
//   // Use any available host or container IP (usually `0.0.0.0`).
//   final ip = InternetAddress.anyIPv4;

//   // Configure a pipeline that logs requests.
//   final handler = Pipeline() //
//       .addMiddleware(logRequests())
//       .addHandler(_router);

//   // For running in containers, we respect the PORT environment variable.
//   final port = int.parse(Platform.environment['PORT'] ?? '8080');
//   final server = await serve(handler, ip, port);
//   print('Server listening on port ${server.port}');
// }
void printAllElementsText(Document document) {
  // Select all script and style elements
  var scriptsAndStyles = document.querySelectorAll('script, style');

  // Remove each selected element
  for (var element in scriptsAndStyles) {
    element.remove();
  }

  // Iterate over all elements
  for (var element in document.body!.nodes) {
    if (element is Element) {
      // Print the text content of the element
      print(element.text);
    }
  }
}
void main() async {
  final response = await http.get(
    Uri.parse('https://vbpl.vn/tw/Pages/vbpq-print.aspx?dvid=13&ItemID=18562'),
  );
  final document = html.parse(response.body);
  printAllElementsText(document);
  print(document);
}
