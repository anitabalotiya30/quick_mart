import 'package:hive_flutter/adapters.dart';

class Pref {
  static late Box _box;

  static Future<void> initializeHive() async {
    _box = await Hive.openBox('data');
  }

  static String get userToken => _box.get('userToken') ?? '';
  static set userToken(String v) => _box.put('userToken', v);
}
