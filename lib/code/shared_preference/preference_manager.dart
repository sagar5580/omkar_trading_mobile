import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Preferences? _storageUtil;
  static SharedPreferences? _preferences;

  static Future<Preferences?> getInstance() async {
    _preferences = await SharedPreferences.getInstance();
    if (_storageUtil == null) {
      var secureStorage = Preferences._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil;
  }

  Preferences._();

  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // get string
  static String? getString(String key, {String? defValue}) {
    if (_preferences == null) return defValue;
    return _preferences!.getString(key) ?? defValue;
  }

  // put string
  static Future<bool>? setString(String key, String value) {
    if (_preferences == null) return null;
    return _preferences!.setString(key, value);
  }

  static int getInt(String key, {int defValue = 0}) {
    if (_preferences == null) return defValue;
    return _preferences!.getInt(key) ?? defValue;
  }

  // put string
  static Future<bool>? setInt(String key, int value) {
    if (_preferences == null) return null;
    return _preferences!.setInt(key, value);
  }

  static bool getBool(String key, bool defValue) {
    if (_preferences == null) return defValue;
    return _preferences!.getBool(key) ?? defValue;
  }

  static setBool(String key, bool value) async {
    _preferences!.setBool(key, value);
  }

  static Future<double> getDouble(String key, double defValue) async {
    if (_preferences == null) return defValue;
    return _preferences!.getDouble(key) ?? defValue;
  }

  static setDouble(String key, double value) async {
    _preferences!.setDouble(key, value);
  }

  static Future<bool> remove(String key) async {
    return _preferences!.remove(key);
  }

  static clear() async {
    _preferences!.clear();
  }
}
