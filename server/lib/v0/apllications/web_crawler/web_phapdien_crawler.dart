import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:server/v0/apllications/phapdien_crawler.dart';
import 'package:server/v0/domain/phapdien_node.dart';

// https://phapdien.moj.gov.vn/TraCuuPhapDien/KQPD/ActionHandler.aspx?do=taodanhmucvbkqpd&demucid=55323c64-e78f-4537-afcd-6a3c2af3c71d
sealed class PhapdienCrawlerType {
  const PhapdienCrawlerType();
}

class PhapdienCrawlerGetNode implements PhapdienCrawlerType {
  const PhapdienCrawlerGetNode({
    this.lenmpc = 20,
  });

  final String type = 'ActionHandler.aspx';
  final String doType = 'loadnodes';
  final int lenmpc;
}

class PhapdienCrawlerGetTree implements PhapdienCrawlerType {
  const PhapdienCrawlerGetTree({
    this.lenmpc = 20,
  });

  final String type = 'TreeBoPD.aspx';
  final String doType = 'taodanhmucvbkqpd';
  final int lenmpc;
}

class WebPhapDienCrawler implements PhapdienCrawler {
  static const String baseUrl = 'https://phapdien.moj.gov.vn';

  String _transformRawPhapdienTree(String value) {
    final lines = value.split('\n');
    final tree = lines[19];
    String result = '';
    final raw = tree.split(' \'[{"');
    raw.removeAt(0);
    result = '[{"${raw.join()}';
    result = result.substring(0, result.length - 3);
    return result;
  }

  @override
  Future<List<PhapdienNode>> getChildrenNodes(PhapdienNode node) async {
    final response = await http.post(
      Uri.https(
        'phapdien.moj.gov.vn',
        '/TraCuuPhapDien/ActionHandler.aspx',
        {
          'do': 'loadnodes',
          'lenmpc': switch (node.type) {
            ChuDePhapdienNodeType() => 0,
            DeMucPhapdienNodeType() => 20,
            ChuongPhapdienNodeType() => 40,
            MucPhapdienNodeType() => 60,
            DieuPhapdienNodeType(:final level) => 60 + level * 20,
          }
              .toString(),
        },
      ),
      headers: {
        'Accept': '*/*',
        'Accept-Language': 'en-US,en;q=0.9,vi;q=0.8',
        'Connection': 'keep-alive',
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Origin': 'https://phapdien.moj.gov.vn',
        'Referer': 'https://phapdien.moj.gov.vn/TraCuuPhapDien/MainBoPD.aspx?mapc=',
        'Sec-Fetch-Dest': 'empty',
        'Sec-Fetch-Mode': 'cors',
        'Sec-Fetch-Site': 'same-origin',
        'X-Requested-With': 'XMLHttpRequest',
      },
      body: 'ItemId=${node.id}',
      encoding: Utf8Codec(),
    );

    final raw = json.decode(response.body);
    if (raw['Erros'] != false) return [];
    final rawData = json.decode(raw['Data']) as List<dynamic>;
    return rawData
        .map(
          (e) => PhapdienNode.fromRawCrawlerData(
            e,
            switch (node.type) {
              ChuDePhapdienNodeType() => DeMucPhapdienNodeType(),
              DeMucPhapdienNodeType() => ChuongPhapdienNodeType(),
              ChuongPhapdienNodeType() => switch ((e['text'] as String).split(' ')[0].toLowerCase().trim()) {
                  'mục' => MucPhapdienNodeType(),
                  _ => DieuPhapdienNodeType(0),
                },
              MucPhapdienNodeType() => DieuPhapdienNodeType(1),
              DieuPhapdienNodeType(:final level) => DieuPhapdienNodeType(level + 1),
            },
          ),
        )
        .toList();
  }

  @override
  Future<List<PhapdienNode>> getRootNodes() async {
    final client = await http.post(
      Uri.parse('https://phapdien.moj.gov.vn/TraCuuPhapDien/TreeBoPD.aspx'),
      headers: {
        'Accept': '*/*',
        'Accept-Language': 'en-US,en;q=0.9,vi;q=0.8',
        'Connection': 'keep-alive',
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
      },
    );

    final result = _transformRawPhapdienTree(client.body);
    final raw = json.decode(result) as List<dynamic>;
    List<PhapdienNode> nodes = [];
    for (final e in raw) {
      var node = PhapdienNode.fromRawCrawlerData(e, ChuDePhapdienNodeType());
      if (node.parent != null) {
        node = node.copyWith(type: DeMucPhapdienNodeType());
      }
      nodes.add(node);
    }
    return nodes;
  }

  @override
  Future<List<PhapdienNode>> getChildrenNodesById(String id, int level) async {
    final response = await http.post(
      Uri.https(
        'phapdien.moj.gov.vn',
        '/TraCuuPhapDien/ActionHandler.aspx',
        {
          'do': 'loadnodes',
          'lenmpc': (20 * level).toString(),
        },
      ),
      headers: {
        'Accept': '*/*',
        'Accept-Language': 'en-US,en;q=0.9,vi;q=0.8',
        'Connection': 'keep-alive',
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8',
        'Origin': 'https://phapdien.moj.gov.vn',
        'Referer': 'https://phapdien.moj.gov.vn/TraCuuPhapDien/MainBoPD.aspx?mapc=',
        'Sec-Fetch-Dest': 'empty',
        'Sec-Fetch-Mode': 'cors',
        'Sec-Fetch-Site': 'same-origin',
        'X-Requested-With': 'XMLHttpRequest',
      },
      body: 'ItemId=$id',
      encoding: Utf8Codec(),
    );

    final raw = json.decode(response.body);
    if (raw['Erros'] != false) throw Exception(raw);

    final rawData = json.decode(raw['Data']) as List<dynamic>;
    return rawData
        .map(
          (e) => PhapdienNode.fromRawCrawlerData(
            e,
            switch (level) {
              0 => DeMucPhapdienNodeType(),
              1 => ChuongPhapdienNodeType(),
              2 => switch ((e['text'] as String).split(' ')[0].toLowerCase().trim()) {
                  'mục' => MucPhapdienNodeType(),
                  _ => DieuPhapdienNodeType(0),
                },
              _ => DieuPhapdienNodeType(level - 2),
            },
          ),
        )
        .toList();
  }

  @override
  Future<String?> getDemucContentById(String id) async {
    try {
      final response = await http.get(
        Uri.parse('https://phapdien.moj.gov.vn/TraCuuPhapDien/BPD/demuc/$id.html'),
        headers: {
          'Accept': '*/*',
          'Accept-Language': 'en-US,en;q=0.9',
          'Connection': 'keep-alive',
          'Sec-Fetch-Mode': 'cors',
          'Sec-Fetch-Site': 'same-origin'
        },
      );
      // This is a hack to fix the encoding issue
      response.headers['content-type'] = 'text/html; charset=utf-8';

      return response.body;
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      return null;
    }
  }
}
