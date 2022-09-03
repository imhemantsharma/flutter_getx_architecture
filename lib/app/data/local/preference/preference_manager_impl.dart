
import 'package:get_storage/get_storage.dart';

import '/app/data/local/preference/preference_manager.dart';

class PreferenceManagerImpl implements PreferenceManager {
  static final GetStorage _storage = GetStorage();

  @override
  T getValue<T>(String key, {T? defaultValue}) => _storage.read<T>(key) ?? defaultValue as T;

  @override
  Future<void> setValue<T>(String key, T value) => _storage.write(key, value);

}
