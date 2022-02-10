import 'dart:async';

import 'package:flutter_getx_architecture/core/networking/api_path.dart';
import 'package:flutter_getx_architecture/core/networking/rest_client.dart';
import 'package:flutter_getx_architecture/ui/home/model/user_data.dart';
import 'package:get/get.dart';

///
abstract class IHomeScreenProvider {
  /// Fetching users list from server
  Future<Response<List<UserData>>> getUsers();
}

///
class HomeScreenProvider extends RestClient implements IHomeScreenProvider {
  @override
  Future<Response<List<UserData>>> getUsers() {
    return get<List<UserData>>(ApiPath.users,
        decoder: (dynamic val) => (val as List<dynamic>)
            .map((dynamic e) => UserData.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}
