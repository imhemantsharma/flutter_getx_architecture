import 'package:get_storage/get_storage.dart';

///
class Preferences {
  static final GetStorage _storage = GetStorage();

  static T getValue<T>(String key, {T? defaultValue}) =>
      _storage.read<T>(key) ?? defaultValue as T;

  static Future<void> setValue<T>(String key, T value) =>
      _storage.write(key, value);
}

/// Key for shared pref all key at one place.
class PrefKey {
  PrefKey._();

  /// to store auth token
  static const String userAuthToken = 'auth_token';
}
