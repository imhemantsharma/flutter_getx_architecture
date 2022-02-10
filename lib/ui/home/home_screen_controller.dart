import 'package:flutter_getx_architecture/core/networking/network_controller.dart';
import 'package:flutter_getx_architecture/ui/home/home_screen_repository.dart';
import 'package:flutter_getx_architecture/ui/home/model/user_data.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController
    with StateMixin<List<UserData>> {
  HomeScreenController(
    this._repository,
  );

  /// Home screen Api call
  final IHomeScreenRepository _repository;

  /// Network check
  final NetworkController _networkController = Get.put(NetworkController());

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    if (!_networkController.isNetworkConnected.value) {
      change(null, status: RxStatus.error('No internet!'));
      return;
    }

    try {
      List<UserData> userList = await _repository.getUsers() ?? [];
      change(userList,
          status: userList.isEmpty ? RxStatus.empty() : RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
