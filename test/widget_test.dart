import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_demo/View/login_page.dart';
import 'package:getx_mvvm_demo/ViewModel/auth_viewmodel.dart';

void main() {
  group('LoginPage', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(home: LoginPage()));

      expect(find.text('Login'), findsNWidgets(2));
      expect(find.byType(TextFormField), findsNWidgets(2));
      expect(find.byType(ElevatedButton), findsNWidgets(1));
    });

    testWidgets('email field updates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(home: LoginPage()));

      final emailField = find.byKey(const Key('Email'));
      await tester.enterText(emailField, 'test@example.com');

      final emailState = Get.find<EmailState>();
      expect(emailState.email.value, 'test@example.com');
    });

    testWidgets('password field updates correctly', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(home: LoginPage()));

      final passwordField = find.byKey(const Key('Password'));
      await tester.enterText(passwordField, 'MyP@ssw0rd');

      final passwordState = Get.find<PasswordState>();
      expect(passwordState.password.value, 'MyP@ssw0rd');
    });

    testWidgets('login button triggers submission', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(home: LoginPage()));

      final loginButton = find.byType(ElevatedButton);
      await tester.tap(loginButton);

      expect(find.byType(SnackBar), findsOneWidget);
    });
  });
}