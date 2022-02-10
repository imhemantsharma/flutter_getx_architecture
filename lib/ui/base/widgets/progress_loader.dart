import 'package:flutter/material.dart';

class ProgressDialog {
  static final ProgressDialog _instance = ProgressDialog.internal();
  static bool _isLoading = false;

  ProgressDialog.internal();

  factory ProgressDialog() => _instance;
  static BuildContext? dialogContext;

  static void closeLoadingDialog() {
    if (_isLoading) {
      Navigator.of(dialogContext!).pop();
      _isLoading = false;
    }
  }

  static void showLoadingDialog(BuildContext context) async {
    _isLoading = true;
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          dialogContext = context;
          return const SimpleDialog(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            children: <Widget>[
              Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
                ),
              )
            ],
          );
        });
  }
}
