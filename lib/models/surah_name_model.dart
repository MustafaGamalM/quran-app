class SurahNameModel {
  late List<Sewar> sewar;
  SurahNameModel.fromJson(Map<String, dynamic> json) {
    if (json['suwar'] != null) {
      sewar = <Sewar>[];
      json['suwar'].forEach((v) {
        sewar.add(new Sewar.fromJson(v));
      });
    }
  }
}

class Sewar {
  late int id;
  late String name;
  late int startPage;
  late int endPage;
  late int makkia;

  Sewar.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    startPage = json['start_page'];
    endPage = json['end_page'];
    makkia = json['makkia'];
  }
}
