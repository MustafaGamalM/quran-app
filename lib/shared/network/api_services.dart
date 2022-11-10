import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio = Dio();

  static Future<Response> getData({required String url}) async {
    return await dio.get(url);
  }
}
