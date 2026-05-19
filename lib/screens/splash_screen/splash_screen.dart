import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vabc_app/screens/splash_screen/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController controller = Get.put(SplashController());

  @override
  void initState() {
    controller.navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Image.asset('assets/images/background.png', fit: BoxFit.cover),
                Text(
                  "V A B C ",
                  style: GoogleFonts.sora(
                    color: Colors.white,
                    fontSize: 47,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'RECORD. TRANSCRIBE. UNDERSTANDU.',
                      style: GoogleFonts.sora(
                        fontSize: 10,
                        color: Colors.white,
                        letterSpacing: 2.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 150,
            left: -59,
            child: Image.asset(
              'assets/images/orangeglow.png',
              opacity: const AlwaysStoppedAnimation(35.0),
            ),
            // width: 380,
            // height: 380,
          ),
          Positioned(
            top: 380,
            left: 100,
            child: Image.asset(
              'assets/images/blueglow.png',
              opacity: const AlwaysStoppedAnimation(23.0),
              // width: 300,
              // height: 300,
            ),
          ),
        ],
      ),
    );
  }
}
