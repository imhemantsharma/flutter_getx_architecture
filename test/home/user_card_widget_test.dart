import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_architecture/app/modules/home/widget/user_card.dart';
import 'package:flutter_test/flutter_test.dart';

import '../mock_test_app.dart';

void main() {
  setUpAll(() {
    ///To rid out of this error
    ///All HTTP requests will return status code 400
    HttpOverrides.global = null;
  });

  testWidgets('User card null test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    ///Passing nothing in 'UserCard()' that means default value of all params are null
    await tester.pumpWidget(createTestApp(child: const UserCard()));
    await tester.pumpAndSettle();

    expect(find.text(''), findsNWidgets(3));
    expect(find.byType(CachedNetworkImage), findsNothing);
  });

  testWidgets('User card valid data test', (WidgetTester tester) async {
    await tester.pumpWidget(createTestApp(child: UserCard(
      key: UniqueKey(),
      title: 'Hemant',
      email: 'imhsharma1@gmail.com',
      url: 'https://picsum.photos/200/300',
      website: 'www.google.com',
    )));

    expect(find.text('Hemant'), findsOneWidget);
    expect(find.text('imhsharma1@gmail.com'), findsOneWidget);
    expect(find.text('www.google.com'), findsOneWidget);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });
}
