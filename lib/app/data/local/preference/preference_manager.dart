abstract class PreferenceManager {
  static const userAuthToken = 'auth_token';

  T getValue<T>(String key, {T? defaultValue});

  Future<void> setValue<T>(String key, T value);
}
