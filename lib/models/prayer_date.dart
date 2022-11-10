class PrayerTimeModel {
  int? code;
  String? status;
  Data? data;

  PrayerTimeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  Timings? timings;

  Data.fromJson(Map<String, dynamic> json) {
    timings =
        json['timings'] != null ? new Timings.fromJson(json['timings']) : null;
  }
}

class Timings {
  String? fajr;
  String? dhuhr;
  String? asr;
  String? maghrib;
  String? isha;

  Timings({
    this.fajr,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
  });

  Timings.fromJson(Map<String, dynamic> json) {
    fajr = json['Fajr'];
    dhuhr = json['Dhuhr'];
    asr = json['Asr'];
    maghrib = json['Maghrib'];
    isha = json['Isha'];
  }
}
