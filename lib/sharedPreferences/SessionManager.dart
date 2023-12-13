import 'package:shared_preferences/shared_preferences.dart';
class SessionManager {
  static const String keyIsLoggedIn = 'isLoggedIn';
  static Future<void> setLoggedIn(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(keyIsLoggedIn, value);
  }
  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(keyIsLoggedIn) ?? false;
  }
}