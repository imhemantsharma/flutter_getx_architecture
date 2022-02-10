import 'package:flutter/material.dart';
import 'package:flutter_getx_architecture/utils/style_constant.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(Styles.paddingDouble),
      child: const CircularProgressIndicator(),
    );
  }
}
