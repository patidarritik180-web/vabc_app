// lib/controllers/forgot_password_controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final isLoading = false.obs;

  Future<void> sendResetLink() async {
    if (emailController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your email address',
        backgroundColor: const Color(0xFF2A2A2A),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
      return;
    }

    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2)); // replace with real API
    isLoading.value = false;

    Get.snackbar(
      'Email Sent',
      'Check your inbox for the reset link',
      backgroundColor: const Color(0xFFE85D20),
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );

    // TODO: navigate after success
    // Get.offNamed('/login');
  }

  void backToSignIn() {
    Get.back();
    // or: Get.offNamed('/login');
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
