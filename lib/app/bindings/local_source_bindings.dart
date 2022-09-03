import 'package:flutter_getx_architecture/app/data/local/preference/preference_manager.dart';
import 'package:flutter_getx_architecture/app/data/local/preference/preference_manager_impl.dart';
import 'package:get/get.dart';

class LocalSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreferenceManager>(
      () => PreferenceManagerImpl(),
      fenix: true,
    );
  }
}
