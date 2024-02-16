import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static SharedPreferencesService? _instance;
  static late SharedPreferences _preferences;

  SharedPreferencesService._();

  // Using a singleton pattern
  static Future<SharedPreferencesService> getInstance() async {
    _instance ??= SharedPreferencesService._();

    _preferences = await SharedPreferences.getInstance();

    return _instance!;
  }

  // Persist and retrieve username

  // Private generic method for retrieving data from shared preferences
  static dynamic getData(String key) {
    // Retrieve data from shared preferences
    var value = _preferences.get(key);
    if (kDebugMode) {
      print('Retrieved $key: $value');
    }
    return value;
  }

  // Private method for saving data to shared preferences
  static void saveData(String key, dynamic value) {
    if (kDebugMode) {
      print('Saving $key: $value');
    }
    // Save data to shared preferences
    if (value is String) {
      _preferences.setString(key, value);
    } else if (value is int) {
      _preferences.setInt(key, value);
    } else if (value is double) {
      _preferences.setDouble(key, value);
    } else if (value is bool) {
      _preferences.setBool(key, value);
    } else if (value is List<String>) {
      _preferences.setStringList(key, value);
    }
  }
}
