import 'package:flutter/material.dart';
import 'package:flutter_getx_architecture/generated/l10n.dart';
import 'package:flutter_getx_architecture/ui/base/widgets/error_view.dart';
import 'package:flutter_getx_architecture/ui/base/widgets/loading_view.dart';
import 'package:flutter_getx_architecture/ui/home/home_screen_controller.dart';
import 'package:flutter_getx_architecture/ui/home/model/user_data.dart';
import 'package:flutter_getx_architecture/ui/home/presentation/user_card.dart';
import 'package:flutter_getx_architecture/utils/constants.dart';
import 'package:flutter_getx_architecture/utils/style_constant.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).homepage),
      ),
      body: RefreshIndicator(
        onRefresh: controller.fetchUsers,
        child: controller.obx(
          (state) => AnimationLimiter(
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.symmetric(
                vertical: Styles.paddingDouble,
              ),
              itemCount: state!.length,
              itemBuilder: (BuildContext context, int index) {
                UserData itemData = state[index];
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(
                    milliseconds: Constants.defaultAnimationMillisecond,
                  ),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: UserCard(
                        title: itemData.name,
                        url: 'https://i.pravatar.cc?img=$index',
                        email: itemData.email,
                        website: itemData.website,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          onLoading: const LoadingView(),
          onError: (error) => ErrorView(
            messageTitle: S.of(context).somethingWentTitle,
            messageDesc: S.of(context).somethingWentMessage,
            errorCTA: S.of(context).tryAgain,
            onErrorCTAClicked: controller.onInit,
          ),
          onEmpty: Center(
            child: Text(S.of(context).noDataFound,
                style: Theme.of(context).textTheme.headline3),
          ),
        ),
      ),
    );
  }
}
