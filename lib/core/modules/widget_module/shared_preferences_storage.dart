import 'package:flutter/services.dart';
import 'package:media_reels/core/log/log.dart';

class SharedPreferencesStorage {
  static Future<String?> setValue(String key, String value) async {
    const platformChannel =
        MethodChannel('com.example.simpleIosWidgetExample/storage');

    try {
      final result = await platformChannel.invokeMethod('savePreferences', {
        'key': key,
        'value': value,
      });
      return result;
    } catch (e) {
      Log.error(e);
      return null;
    }
  }
}
