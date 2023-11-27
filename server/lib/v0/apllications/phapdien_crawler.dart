// https://phapdien.moj.gov.vn/TraCuuPhapDien/KQPD/ActionHandler.aspx?do=taodanhmucvbkqpd&demucid=55323c64-e78f-4537-afcd-6a3c2af3c71d
sealed class PhapdienCrawlerType {
  const PhapdienCrawlerType();
}

// enum PhapdienCrawlerType {
//   actionHandler('ActionHandler.aspx'),
//   treeBoPD('TreeBoPD.aspx'),
//   ;

//   const PhapdienCrawlerType(this.type);
//   final String type;
// }

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

/// https://phapdien.moj.gov.vn/TraCuuPhapDien/ActionHandler.aspx?do=loadnodes&lenmpc=20
class PhapdienCrawler {
  const PhapdienCrawler({
    required this.rootUrl,
  });

  final String rootUrl;
}
