import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_getx_architecture/app/core/widgets/error_view.dart';
import 'package:flutter_getx_architecture/app/core/widgets/loading_view.dart';
import 'package:flutter_getx_architecture/app/data/repository/users_data_repository.dart';
import 'package:flutter_getx_architecture/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_getx_architecture/app/modules/home/widget/user_card.dart';
import 'package:flutter_getx_architecture/app/my_app.dart';
import 'package:flutter_getx_architecture/app/network/network_controller.dart';
import 'package:flutter_getx_architecture/generated/l10n.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';

import '../test/mock_network_info.dart';
import 'mock_users_data_repository.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late BindingsBuilder binding;
  late HomeController controller;

  setUpAll(() {
    /// HTTP requests will return status code 400
    HttpOverrides.global = null;

    binding = BindingsBuilder<dynamic>(() {
      Get.lazyPut<INetworkInfoProvider>(() => MockNetworkInfo());
      Get.lazyPut<IUsersDataRepository>(() => MockUsersDataRepository());
      Get.lazyPut(() => HomeController());
    });

    binding.builder();
    controller = Get.find<HomeController>();
  });

  Future<void> addDelay(int ms) async {
    await Future<void>.delayed(Duration(milliseconds: ms));
  }

  group('end-to-end test', () {
    testWidgets('Home screen test', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());

      /// Empty state test
      await addDelay(1000);
      controller.change(null, status: RxStatus.empty());
      await tester.pumpAndSettle();

      BuildContext context = tester.element(find.byType(Center));
      expect(find.text(S.of(context).noDataFound), findsOneWidget);

      expect(find.byType(ErrorView), findsNothing);
      expect(find.byType(LoadingView), findsNothing);

      /// Error state test
      await addDelay(1000);
      controller.change(null, status: RxStatus.error('Something went wrong!'));
      await tester.pumpAndSettle();

      context = tester.element(find.byType(ErrorView));
      expect(find.byType(ErrorView), findsOneWidget);
      expect(find.text(S.of(context).tryAgain), findsOneWidget);

      expect(find.byType(LoadingView), findsNothing);
      expect(find.text(S.of(context).noDataFound), findsNothing);

      await addDelay(3000);

      // Emulate a tap on the try again button to fetch the data.
      await tester.tap(find.text(S.of(context).tryAgain));
      await tester.pumpAndSettle();

      await addDelay(3000);

      // Verify the the fetched data.
      expect(find.byType(UserCard), findsWidgets);

      await addDelay(3000);

      await tester.ensureVisible(find.byType(UserCard).last);
      await tester.pumpAndSettle();
      await addDelay(5000);
    });
  });
}
