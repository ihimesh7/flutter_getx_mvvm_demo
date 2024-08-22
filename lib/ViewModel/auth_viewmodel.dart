import 'package:get/get.dart';
import 'package:getx_mvvm_demo/Utility/common_functions.dart';

class EmailState extends GetxController {
  final email = ''.obs; // Reactive variable for email
  final isEmailValid = false.obs; // Initial validation state
  final hasInteracted = false.obs; // Flag to track user interaction

  @override
  void onInit() {
    super.onInit();
    // debounceTime = const Duration(milliseconds: 500); // Debounce for smoother validation (optional)
    ever(email, (email) {
      hasInteracted.value = true; // Set flag to true when user interacts with the field
      isEmailValid.value = EmailValidator.isValidEmail(email); // Update validation on change
    });
  }
}

class PasswordState extends GetxController {
  final password = ''.obs; // Reactive variable for password
  final isPasswordValid = false.obs; // Initial validation state
  final hasInteracted = false.obs; // Flag to track user interaction

  @override
  void onInit() {
    super.onInit();
    // debounceTime = const Duration(milliseconds: 500); // Debounce for smoother validation (optional)
    ever(password, (password) {
      hasInteracted.value = true; // Set flag to true when user interacts with the field
      isPasswordValid.value = PasswordValidator.isValidPassword(password); // Update validation on change
    });
  }
}