import 'package:flutter/material.dart';
import 'package:flutter_getx_architecture/app/bindings/initial_binding.dart';
import 'package:flutter_getx_architecture/app/core/utils/light_theme.dart';
import 'package:flutter_getx_architecture/app/modules/home/views/home_view.dart';
import 'package:flutter_getx_architecture/app/routes/app_pages.dart';
import 'package:flutter_getx_architecture/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

///
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter_getx_architecture',
      theme: lightTheme,
      initialBinding: InitialBinding(),
      initialRoute: AppPages.initial.routeName,
      unknownRoute: GetPage<dynamic>(
        name: AppPages.initial.routeName,
        page: () {
          return const HomeView();
        },
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      getPages: AppPages.routes,
    );
  }
}
