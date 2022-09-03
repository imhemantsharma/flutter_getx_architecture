import 'package:flutter_getx_architecture/app/network/network_controller.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MockNetworkInfo implements INetworkInfoProvider {
  @override
  RxBool get isNetworkConnected => true.obs;

}