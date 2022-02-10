import 'package:flutter_getx_architecture/ui/home/home_screen_controller.dart';
import 'package:flutter_getx_architecture/ui/home/home_screen_provider.dart';
import 'package:flutter_getx_architecture/ui/home/home_screen_repository.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IHomeScreenProvider>(() => HomeScreenProvider());
    Get.lazyPut<IHomeScreenRepository>(
        () => HomeScreenRepository(provider: Get.find()));

    Get.lazyPut<HomeScreenController>(() => HomeScreenController(Get.find()));
  }
}
