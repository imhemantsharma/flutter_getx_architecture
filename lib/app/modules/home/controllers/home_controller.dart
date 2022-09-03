
import 'package:flutter_getx_architecture/app/core/base/base_controller.dart';
import 'package:flutter_getx_architecture/app/data/model/user_data_response.dart';
import 'package:flutter_getx_architecture/app/data/repository/users_data_repository.dart';
import 'package:get/get.dart';

class HomeController extends BaseController
    with StateMixin<List<UserDataResponse>> {

  /// Home screen Api call
  final IUsersDataRepository _repository = Get.find();

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.loading());
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    callDataService(
      _repository.getUsers(),
      onNetworkError: (String message) {
        change(null, status: RxStatus.error(message));
      },
      onSuccess: (List<UserDataResponse>? userList) {
        change(userList,
            status: (userList?.isEmpty ?? false) ? RxStatus.empty() : RxStatus.success());
      },
      onError: (Exception exception) {
        change(null, status: RxStatus.error(exception.toString()));
      }
    );
  }
}
