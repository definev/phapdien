import 'package:http/http.dart' as http;
import 'package:shelf/shelf.dart';

String _transformRawPhapdien(String value) {
  final lines = value.split('\n');
  final tree = lines[19];
  String result = '';
  final raw = tree.split(' \'[{"');
  raw.removeAt(0);
  result = '[{"${raw.join()}';
  result = result.substring(0, result.length - 3);
  return result;
}

Future<Response> phapDienHandler(Request req) async {
  final client = await http.post(
    Uri.parse('https://phapdien.moj.gov.vn/TraCuuPhapDien/TreeBoPD.aspx'),
    headers: {
      'Accept': '*/*',
      'Accept-Language': 'en-US,en;q=0.9,vi;q=0.8',
      'Connection': 'keep-alive',
      'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
    },
  );

  final result = _transformRawPhapdien(client.body);

  return Response.ok(
    result,
    headers: {'Content-Type': 'application/json; charset=UTF-8'},
  );
}
