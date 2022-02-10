import 'dart:io';

abstract class Functions {
  static bool get isIos => Platform.isIOS;

  static bool get isAndroid => Platform.isAndroid;

  static String get platform {
    if (isIos) {
      return 'iOS';
    } else if (isAndroid) {
      return 'Android';
    }

    return 'Unknown';
  }
}
