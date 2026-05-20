import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  List<TextEditingController> otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  List<FocusNode> focusNodes = List.generate(6, (index) => FocusNode());

  RxInt seconds = 42.obs;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() async {
    while (seconds.value > 0) {
      await Future.delayed(const Duration(seconds: 1));
      seconds.value--;
    }
  }

  void onOtpChanged(String value, int index) {
    if (value.isNotEmpty && index < 5) {
      focusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  String get otpCode {
    return otpControllers.map((e) => e.text).join();
  }

  void verifyOtp() {
    Get.snackbar(
      "OTP",
      "Entered OTP: $otpCode",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    for (var controller in otpControllers) {
      controller.dispose();
    }

    for (var node in focusNodes) {
      node.dispose();
    }

    super.onClose();
  }
}
