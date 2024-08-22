import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_demo/ViewModel/auth_viewmodel.dart';

void main() {
  group('EmailState', () {
    test('initial state', () {
      final emailState = EmailState();
      expect(emailState.email.value, '');
      expect(emailState.isEmailValid.value, false);
      expect(emailState.hasInteracted.value, false);
    });

    test('email validation', () {
      final emailState = EmailState();
      emailState.email.value = 'test@example.com';
      expect(emailState.isEmailValid.value, true);

      emailState.email.value = 'invalid email';
      expect(emailState.isEmailValid.value, false);
    });

    test('hasInteracted flag', () {
      final emailState = EmailState();
      emailState.email.value = 'test@example.com';
      expect(emailState.hasInteracted.value, true);
    });
  });

  group('PasswordState', () {
    test('initial state', () {
      final passwordState = PasswordState();
      expect(passwordState.password.value, '');
      expect(passwordState.isPasswordValid.value, false);
      expect(passwordState.hasInteracted.value, false);
    });

    test('password validation', () {
      final passwordState = PasswordState();
      passwordState.password.value = 'MyP@ssw0rd';
      expect(passwordState.isPasswordValid.value, true);

      passwordState.password.value = 'invalid password';
      expect(passwordState.isPasswordValid.value, false);
    });

    test('hasInteracted flag', () {
      final passwordState = PasswordState();
      passwordState.password.value = 'MyP@ssw0rd';
      expect(passwordState.hasInteracted.value, true);
    });
  });
}