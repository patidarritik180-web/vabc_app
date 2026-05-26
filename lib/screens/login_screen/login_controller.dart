import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RxBool isPasswordVisible = false.obs;
  RxBool rememberMe = true.obs;
  RxBool isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  void toggleRememberMe() {
    rememberMe.toggle();
  }

  Future<void> signIn() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all fields',
        backgroundColor: const Color(0xFF2A2A2A),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );

      return;
    }

    try {
      isLoading.value = true;

      // TODO: API CALL
      await Future.delayed(const Duration(seconds: 2));

      // TODO: Navigate to home
      // Get.offAllNamed('/home');
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Color(0xFFFB923C),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void continueWithApple() {
    // TODO
  }

  void continueWithGoogle() {
    // TODO
  }

  void forgotPassword() {
    // Get.toNamed('/forgot-password');
  }

  void createAccount() {
    // Get.toNamed('/register');
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }
}
