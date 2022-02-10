import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_getx_architecture/core/shared_preference/pref_util.dart';

/// Header setup
Future<Map<String, String>> getHeaders() async {
  String? deviceModel;
  String? appVersion;
  String? appVersionCode;
  String? deviceId;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  final token =
      Preferences.getValue<String>(PrefKey.userAuthToken, defaultValue: null);

  /// set values dynamically
  if (Platform.isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;

    deviceModel = iosInfo.utsname.machine as String;
    deviceId = iosInfo.identifierForVendor as String;
  } else if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    deviceModel = androidInfo.model as String;
    deviceId = androidInfo.androidId as String;
  }
  var headers = <String, String>{};
  headers['appversion'] = appVersion ?? '';
  headers['appversioncode'] = appVersionCode ?? '';

  /// Constant
  if (!headers.containsKey('Content-Type')) {
    headers['Content-Type'] = 'application/json';
  }
  headers['source'] = 'parentapp';
  headers['apptype'] = Platform.operatingSystem;
  headers['osversion'] = Platform.operatingSystemVersion;
  headers['devicemodelname'] = deviceModel ?? 'NA';
  headers['deviceId'] = deviceId ?? 'NA';
  headers['authorization'] = token;

  return headers;
}
