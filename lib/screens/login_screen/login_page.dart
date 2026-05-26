import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vabc_app/screens/create_account/signup_page.dart';
import 'package:vabc_app/screens/forgot_pass_page/forgot_password_page.dart';

import 'package:vabc_app/screens/login_screen/login_controller.dart';
import 'package:vabc_app/widgets/common_back_button.dart';

//import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController ctrl = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // LOGO
              Row(
                children: [
                  CommonLogoUi(),

                  const SizedBox(width: 4),

                  Text(
                    'V A B C',
                    style: GoogleFonts.sora(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // TITLE
              Text(
                'Welcome to VABC',
                style: GoogleFonts.sora(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Sign in to access your memories.',
                style: GoogleFonts.sora(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 36),

              // EMAIL FIELD
              _InputField(
                controller: ctrl.emailController,
                hint: 'Enter your email',
                prefixIcon: Icons.mail_outline,
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 14),

              // PASSWORD FIELD
              Obx(
                () => _InputField(
                  controller: ctrl.passwordController,
                  hint: '••••••••',
                  prefixIcon: Icons.lock_outline,
                  obscureText: !ctrl.isPasswordVisible.value,
                  suffixIcon: GestureDetector(
                    onTap: ctrl.togglePasswordVisibility,
                    child: Icon(
                      ctrl.isPasswordVisible.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.white38,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // REMEMBER + FORGOT
              Row(
                children: [
                  Obx(
                    () => GestureDetector(
                      onTap: ctrl.toggleRememberMe,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: 44,
                        height: 26,
                        decoration: BoxDecoration(
                          color: ctrl.rememberMe.value
                              ? const Color(0xFFFB923C)
                              : Colors.white24,
                          borderRadius: BorderRadius.circular(50),
                        ),

                        child: AnimatedAlign(
                          duration: const Duration(milliseconds: 250),
                          alignment: ctrl.rememberMe.value
                              ? Alignment.centerRight
                              : Alignment.centerLeft,

                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 3),
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Text(
                    'Remember me',
                    style: GoogleFonts.sora(
                      color: Colors.white.withOpacity(0.65),
                      fontSize: 13,
                    ),
                  ),

                  const Spacer(),

                  GestureDetector(
                    onTap: () {
                      Get.to(() => ForgotPasswordPage());
                    },
                    child: Text(
                      'Forgot password?',
                      style: GoogleFonts.sora(
                        color: Color(0xFFFB923C),
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 28),

              // SIGN IN BUTTON
              Obx(
                () => GestureDetector(
                  onTap: ctrl.isLoading.value ? null : ctrl.signIn,

                  child: Container(
                    width: double.infinity,
                    height: 54,

                    decoration: BoxDecoration(
                      color: const Color(0xFFE85D20),
                      borderRadius: BorderRadius.circular(14),

                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE85D20).withOpacity(0.4),
                          blurRadius: 20,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),

                    child: ctrl.isLoading.value
                        ? const Center(
                            child: SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2.5,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Text(
                                'Sign In',
                                style: GoogleFonts.sora(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              SizedBox(width: 8),

                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 18,
                              ),
                            ],
                          ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // DIVIDER
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.white.withOpacity(0.12)),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),

                    child: Text(
                      'OR CONTINUE WITH',
                      style: GoogleFonts.sora(
                        color: Colors.white.withOpacity(0.35),
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Divider(color: Colors.white.withOpacity(0.12)),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // APPLE BUTTON
              _SocialButton(
                onTap: ctrl.continueWithApple,
                icon: const Icon(Icons.apple, color: Colors.white, size: 22),
                label: 'Continue with Apple',
              ),

              const SizedBox(height: 12),

              // GOOGLE BUTTON
              _SocialButton(
                onTap: ctrl.continueWithGoogle,

                icon: Image.asset(
                  'assets/images/googlelogo.png',
                  width: 18,
                  height: 18,
                ),

                label: 'Continue with Google',
              ),

              const SizedBox(height: 90),

              // CREATE ACCOUNT
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No account?',
                      style: GoogleFonts.sora(
                        color: Colors.white.withOpacity(0.45),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        Get.to(SignupPage());
                      },

                      child: Text(
                        'Create one',
                        style: GoogleFonts.sora(color: Color(0xFFE85D20)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// INPUT FIELD
class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;

  const _InputField({
    required this.controller,
    required this.hint,
    required this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,

      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(14),
      ),

      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,

        style: const TextStyle(color: Colors.white, fontSize: 14),

        decoration: InputDecoration(
          hintText: hint,

          hintStyle: TextStyle(color: Colors.white.withOpacity(0.30)),

          prefixIcon: Icon(prefixIcon, color: Colors.white38),

          suffixIcon: suffixIcon,

          border: InputBorder.none,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}

// SOCIAL BUTTON
class _SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  final Widget icon;
  final String label;

  const _SocialButton({
    required this.onTap,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        width: double.infinity,
        height: 54,

        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(14),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            icon,

            const SizedBox(width: 10),

            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
