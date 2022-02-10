import 'package:flutter_getx_architecture/ui/home/home_screen_provider.dart';
import 'package:flutter_getx_architecture/ui/home/model/user_data.dart';

///
class HomeScreenRepository implements IHomeScreenRepository {
  ///
  HomeScreenRepository({required this.provider});

  ///
  final IHomeScreenProvider provider;

  @override
  Future<List<UserData>?> getUsers() async {
    final response = await provider.getUsers();
    if (response.status.isOk) {
      return response.body;
    }
    return null;
  }
}

///
abstract class IHomeScreenRepository {
  ///
  Future<List<UserData>?> getUsers();
}
