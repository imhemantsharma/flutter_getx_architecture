import 'dart:async';

import 'package:flutter/material.dart';

import '/app/core/values/app_values.dart';

class Debouncer {

  Debouncer({this.milliseconds = AppValues.defaultDebounceTimeInMilliSeconds});

  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
