import 'package:flutter/material.dart';

class ScreenUtil {
  ///Private constructor
  ScreenUtil._();

  /// get device screen height
  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  /// get device screen width
  static double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getBlockSizeHorizontal(BuildContext context) =>
      (getScreenWidth(context) / 100);

  static double getBlockSizeVertical(BuildContext context) =>
      (getScreenHeight(context) / 100);

  static double getSafeBlockHorizontal(BuildContext context) =>
      ((getScreenWidth(context) -
              (MediaQuery.of(context).padding.left +
                  MediaQuery.of(context).padding.right)) /
          100);

  static double getSafeBlockVertical(BuildContext context) =>
      ((getScreenHeight(context) -
              (MediaQuery.of(context).padding.top +
                  MediaQuery.of(context).padding.bottom)) /
          100);
}
