// https://phapdien.moj.gov.vn/TraCuuPhapDien/KQPD/ActionHandler.aspx?do=taodanhmucvbkqpd&demucid=55323c64-e78f-4537-afcd-6a3c2af3c71d
enum PhapdienCrawlerType {
  actionHandler('ActionHandler.aspx'),
  treeBoPD('TreeBoPD.aspx'),
  ;

  const PhapdienCrawlerType(this.type);
  final String type;

}

/// https://phapdien.moj.gov.vn/TraCuuPhapDien/ActionHandler.aspx?do=loadnodes&lenmpc=20
class PhapdienCrawler {
  const PhapdienCrawler({
    required this.rootUrl,
  });
  final String rootUrl;
}
