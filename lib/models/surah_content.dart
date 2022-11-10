class SurahContentModel {
  int? id;
  String? name;
  String? nameEn;
  String? nameTranslation;
  int? words;
  int? letters;
  String? type;
  String? typeEn;
  String? ar;
  String? en;
  List<Array>? array;

  SurahContentModel(
      {this.id,
      this.name,
      this.nameEn,
      this.nameTranslation,
      this.words,
      this.letters,
      this.type,
      this.typeEn,
      this.ar,
      this.en,
      this.array});

  SurahContentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameEn = json['name_en'];
    nameTranslation = json['name_translation'];
    words = json['words'];
    letters = json['letters'];
    type = json['type'];
    typeEn = json['type_en'];
    ar = json['ar'];
    en = json['en'];
    if (json['array'] != null) {
      array = <Array>[];
      json['array'].forEach((v) {
        array!.add(new Array.fromJson(v));
      });
    }
  }
}

class Array {
  int? id;
  String? ar;
  String? en;
  String? filename;
  String? path;
  String? dir;
  int? size;

  Array(
      {this.id,
      this.ar,
      this.en,
      this.filename,
      this.path,
      this.dir,
      this.size});

  Array.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ar = json['ar'];
    en = json['en'];
    filename = json['filename'];
    path = json['path'];
    dir = json['dir'];
    size = json['size'];
  }
}
