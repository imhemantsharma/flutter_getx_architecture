import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_architecture/core/routes/app_pages.dart';
import 'package:flutter_getx_architecture/generated/l10n.dart';
import 'package:flutter_getx_architecture/ui/home/presentation/home_screen.dart';
import 'package:flutter_getx_architecture/utils/light_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Get storage initialization for pref
  await GetStorage.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) {
    runApp(
      const MyApp(),
    );
  });
}

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
      title: 'Flutter GetX Architecture',
      theme: lightTheme,
      initialRoute: AppPages.initial.name,
      unknownRoute: GetPage<dynamic>(
        name: AppPages.initial.name,
        page: () {
          return const HomeScreen();
        },
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onReady: () {
        /// We can use this callback for Dynamic/App Link
      },
      getPages: AppPages.routes,
      navigatorObservers: const [
        /// Analytic Service Observer, Navigator Observer etc
      ],
    );
  }
}
