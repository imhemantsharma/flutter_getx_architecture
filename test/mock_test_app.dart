import 'package:flutter/widgets.dart';
import 'package:flutter_getx_architecture/generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

Widget createTestApp({required Widget child, Bindings? binding}) {
  return GetMaterialApp(
    home: child,
    initialBinding: binding,
    localizationsDelegates: const [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: S.delegate.supportedLocales,
  );
}