import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  // TEXT CONTROLLERS
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // OBSERVABLES
  RxBool isPasswordVisible = false.obs;
  RxBool agreeTerms = true.obs;
  RxBool isLoading = false.obs;

  // DROPDOWN VALUES
  RxString primaryLanguage = 'English'.obs;
  RxString secondaryLanguage = 'Hindi'.obs;

  List<String> languages = ['English', 'Hindi', 'Gujarati', 'Marathi', 'Tamil'];

  // TOGGLE PASSWORD
  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  // TOGGLE TERMS
  void toggleAgreeTerms() {
    agreeTerms.toggle();
  }

  // CHANGE LANGUAGE
  void changePrimaryLanguage(String? value) {
    if (value != null) {
      primaryLanguage.value = value;
    }
  }

  void changeSecondaryLanguage(String? value) {
    if (value != null) {
      secondaryLanguage.value = value;
    }
  }

  // CREATE ACCOUNT
  Future<void> createAccount() async {
    if (fullNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );

      return;
    }

    if (!agreeTerms.value) {
      Get.snackbar(
        'Terms Required',
        'Please accept Terms & Privacy Policy',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );

      return;
    }

    try {
      isLoading.value = true;

      // TODO API CALL
      await Future.delayed(const Duration(seconds: 2));

      Get.snackbar(
        'Success',
        'Account created successfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // TODO NAVIGATION
      // Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // SIGN IN
  void goToLogin() {
    // Get.toNamed('/login');
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }
}
