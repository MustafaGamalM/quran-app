import 'package:shared_preferences/shared_preferences.dart';

class CasheHelper {
  static SharedPreferences? preferences;
  static inite() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(
      {required String key, required bool value}) async {
    return await preferences!.setBool(key, value);
  }

  static getData({required String key}) {
    return preferences!.getBool(key);
  }
}
