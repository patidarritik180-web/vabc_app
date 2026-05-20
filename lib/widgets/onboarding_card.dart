import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vabc_app/screens/login_screen/login_page.dart';
import 'package:vabc_app/widgets/common_back_button.dart';

class OnboardingCard extends StatelessWidget {
  final String image;

  const OnboardingCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Column(
        children: [
          /// TOP BAR
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// LOGO
                CommonLogoUi(),

                const SizedBox(width: 4),

                /// TITLE
                Text(
                  "V A B C",

                  style: GoogleFonts.sora(
                    color: Colors.black,

                    fontSize: 14,

                    fontWeight: FontWeight.bold,

                    letterSpacing: 2.8,
                  ),
                ),

                const Spacer(),

                /// SKIP BUTTON
                TextButton(
                  onPressed: () {
                    Get.to(() => LoginPage());
                  },

                  child: Text(
                    "Skip",

                    style: GoogleFonts.sora(
                      color: Colors.black54,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// CENTER IMAGE
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),

              child: SizedBox(
                width: 346,
                height: 488,

                child: Image.asset(image, fit: BoxFit.contain),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
