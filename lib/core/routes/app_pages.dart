import 'package:flutter/material.dart';
import 'package:flutter_getx_architecture/ui/home/home_binding.dart';
import 'package:flutter_getx_architecture/ui/home/presentation/home_screen.dart';
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
      name: Routes.launch.name,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
