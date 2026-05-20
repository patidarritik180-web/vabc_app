import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';
import 'package:vabc_app/screens/onboarding_screen/onboarding_page.dart';

class SplashController extends GetxController {
  void navigateToHome() async {
    await Future.delayed(
      Duration(seconds: 5),
    ).then((value) => Get.off(() => OnboardingPage()));
  }
}
