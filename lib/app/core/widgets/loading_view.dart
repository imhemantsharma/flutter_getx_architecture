import 'package:flutter/material.dart';
import 'package:flutter_getx_architecture/app/core/values/app_values.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(AppValues.paddingDouble),
      child: const CircularProgressIndicator(),
    );
  }
}
