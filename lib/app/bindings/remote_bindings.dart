
import 'package:flutter_getx_architecture/app/data/provider/users_data_provider.dart';
import 'package:flutter_getx_architecture/app/data/repository/users_data_repository.dart';
import 'package:get/get.dart';

class RemoteBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IUsersDataProvider>(() => UsersDataProvider());
    Get.lazyPut<IUsersDataRepository>(() => UsersDataRepository(provider: Get.find()));
  }
}
