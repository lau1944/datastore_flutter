
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/// A plugin class for android latest Jetpack component [DataStore]
class DataStorePlugin {

  /// Channel Name
  static const MethodChannel _channel =
      const MethodChannel('datastore_plugin');

  /// Create method name
  static const String _createMethod = 'set_data_store';

  /// Get method name
  static const String _getMethod = 'get_data_store';

  /// Set method name
  static const String _setMethod = 'set_data_store';

  static Future createDataStore({@required String name}) async {
    await _channel.invokeMethod(_createMethod);
  }

  /// get value method
  /// data store key is required (similar to [sharedPreference]
  static Future<dynamic> getStoreValue({@required String key}) async {
    final String result = await _channel.invokeMethod(_getMethod, {'key' :key});
    return result;
  }

  /// set value method
  static Future<dynamic> setStoreValue({@required String key}) async {
    final String result = await _channel.invokeMethod(_setMethod, {'key' :key});
    return result;
  }
}
