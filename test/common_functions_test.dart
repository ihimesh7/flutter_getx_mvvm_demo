import 'package:flutter_test/flutter_test.dart';
import 'package:getx_mvvm_demo/Utility/common_functions.dart';

void main() {
  group('EmailValidator', () {
    test('valid email', () {
      expect(EmailValidator.isValidEmail('test@example.com'), true);
    });

    test('invalid email', () {
      expect(EmailValidator.isValidEmail('invalid email'), false);
    });
  });

  group('PasswordValidator', () {
    test('valid password', () {
      expect(PasswordValidator.isValidPassword('MyP@ssw0rd'), true);
    });

    test('invalid password', () {
      expect(PasswordValidator.isValidPassword('invalid password'), false);
    });
  });
}