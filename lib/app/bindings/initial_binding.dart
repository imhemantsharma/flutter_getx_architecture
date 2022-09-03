import 'package:flutter_getx_architecture/app/bindings/local_source_bindings.dart';
import 'package:flutter_getx_architecture/app/bindings/remote_bindings.dart';
import 'package:get/get.dart';
import 'package:flutter_getx_architecture/app/network/network_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<INetworkInfoProvider>(() => NetworkController());
    RemoteBindings().dependencies();
    LocalSourceBindings().dependencies();
  }
}
