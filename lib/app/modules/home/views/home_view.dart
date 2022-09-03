import 'package:flutter/material.dart';
import 'package:flutter_getx_architecture/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_getx_architecture/app/core/values/app_values.dart';
import 'package:flutter_getx_architecture/app/core/widgets/error_view.dart';
import 'package:flutter_getx_architecture/app/core/widgets/loading_view.dart';
import 'package:flutter_getx_architecture/app/data/model/user_data_response.dart';
import 'package:flutter_getx_architecture/app/modules/home/widget/user_card.dart';
import 'package:flutter_getx_architecture/generated/l10n.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).homepage),
      ),
      body: RefreshIndicator(
        onRefresh: controller.fetchUsers,
        child: controller.obx(
          (state) => ListView.builder(
            shrinkWrap: true,
            primary: false,
            padding: const EdgeInsets.symmetric(
              vertical: AppValues.paddingDouble,
            ),
            itemCount: state?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              UserDataResponse itemData = state![index];
              return UserCard(
                title: itemData.name,
                url: 'https://i.pravatar.cc?img=$index',
                email: itemData.email,
                website: itemData.website,
              );
            },
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
