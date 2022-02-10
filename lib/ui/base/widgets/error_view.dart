import 'package:flutter/material.dart';
import 'package:flutter_getx_architecture/core/networking/network_controller.dart';
import 'package:flutter_getx_architecture/generated/l10n.dart';
import 'package:flutter_getx_architecture/utils/style_constant.dart';
import 'package:flutter_getx_architecture/utils/ui_utils.dart';
import 'package:get/get.dart';

class ErrorView extends StatelessWidget {
  ErrorView({
    Key? key,
    this.containerHeight,
    this.messageTitle,
    this.messageDesc,
    this.errorCTA,
    this.errorIcon,
    this.titleColor,
    this.descriptionColor,
    this.bgColor,
    this.onErrorCTAClicked,
  }) : super(key: key);

  final double? containerHeight;
  final String? messageTitle;
  final String? messageDesc;
  final String? errorCTA;
  final IconData? errorIcon;
  final Color? titleColor;
  final Color? descriptionColor;
  final Color? bgColor;
  final VoidCallback? onErrorCTAClicked;

  final NetworkController _networkController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(Styles.marginDouble),
      padding:
          const EdgeInsets.all(Styles.paddingDouble + Styles.defaultPadding),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Styles.defaultBorderRadius),
        color: bgColor ?? Colors.black.withOpacity(0.03),
      ),
      height: containerHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              _networkController.isNetworkConnected.value
                  ? messageTitle ?? S.of(context).noNetworkTitle
                  : S.of(context).noNetworkTitle,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: titleColor)),
          verticalSpace(Styles.paddingMini),
          Text(
            _networkController.isNetworkConnected.value
                ? messageDesc ?? ''
                : S.of(context).noNetworkMessage,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                fontWeight: FontWeight.normal,
                color: descriptionColor ?? Theme.of(context).disabledColor),
          ),
          verticalSpace(Styles.paddingDouble),
          if (onErrorCTAClicked != null) _errorCTA(context),
        ],
      ),
    );
  }

  Widget _errorCTA(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.all(Styles.marginDouble),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(21),
        type: MaterialType.card,
        child: InkWell(
          onTap: onErrorCTAClicked,
          borderRadius: BorderRadius.circular(21),
          child: Container(
            padding: const EdgeInsets.all(Styles.defaultPadding),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(21),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  errorIcon ?? Icons.refresh,
                  size: Styles.defaultIconSize,
                ),
                horizontalSpace(Styles.paddingMini),
                Text(
                  errorCTA ?? 'Retry',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
