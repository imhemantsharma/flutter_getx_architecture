import 'package:flutter/material.dart';
import 'package:flutter_getx_architecture/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_getx_architecture/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

///
class AppPages {
  /// private constructor
  AppPages._();

  /// Initial launch screen path
  static const initial = Routes.launch;

  /// All available routes declaration
  static final routes = [
    GetPage<MaterialPageRoute>(
      name: Routes.launch.routeName,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
