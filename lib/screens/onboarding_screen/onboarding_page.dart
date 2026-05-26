import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vabc_app/screens/login_screen/login_page.dart';
import 'package:vabc_app/widgets/onboarding_card.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  int currentIndex = 0;

  /// ONBOARDING PAGES
  final List<Widget> onBoardingPages = const [
    OnboardingCard(image: "assets/images/Container.png"),

    OnboardingCard(image: "assets/images/page2.png"),

    OnboardingCard(image: "assets/images/page3.png"),
  ];

  /// BOTTOM IMAGES
  final List<String> bottomImages = [
    "assets/images/bottom.png",
    "assets/images/page2bottom.png",
    "assets/images/page3bottom.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F5F2),

      body: SafeArea(
        child: Column(
          children: [
            /// PAGEVIEW
            Expanded(
              child: PageView(
                controller: _pageController,

                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },

                children: onBoardingPages,
              ),
            ),

            /// BOTTOM SECTION
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),

              child: Column(
                children: [
                  /// CHANGING IMAGE
                  SizedBox(
                    width: double.infinity,
                    height: 120,

                    child: Image.asset(
                      bottomImages[currentIndex],
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// INDICATOR + BUTTON
                  Row(
                    children: [
                      /// PAGE INDICATOR
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,

                          child: SmoothPageIndicator(
                            controller: _pageController,

                            count: 3,

                            effect: ExpandingDotsEffect(
                              dotHeight: 8,
                              dotWidth: 8,

                              activeDotColor: const Color(0xffFF6B35),

                              dotColor: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ),

                      /// BUTTON
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            if (currentIndex < 2) {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),

                                curve: Curves.easeInOut,
                              );
                            } else {
                              Get.to(() => LoginPage());
                            }
                          },

                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),

                            width: currentIndex == 2 ? 180 : 70,

                            height: 54,

                            decoration: BoxDecoration(
                              color: const Color(0xffFF6B35),

                              borderRadius: BorderRadius.circular(
                                currentIndex == 2 ? 18 : 35,
                              ),

                              boxShadow: [
                                BoxShadow(
                                  color: const Color(
                                    0xffFF6B35,
                                  ).withOpacity(0.35),

                                  blurRadius: 18,
                                  spreadRadius: 2,

                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),

                            child: Center(
                              child: currentIndex == 2
                                  /// LAST PAGE BUTTON
                                  ? Row(
                                      mainAxisSize: MainAxisSize.min,

                                      children: const [
                                        Text(
                                          "Get Started",

                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                        SizedBox(width: 8),

                                        Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                          size: 22,
                                        ),
                                      ],
                                    )
                                  /// NORMAL BUTTON
                                  : const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
