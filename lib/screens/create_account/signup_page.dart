import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vabc_app/screens/create_account/singup_controller.dart';
import 'package:vabc_app/screens/login_screen/login_page.dart';
import 'package:vabc_app/verification_page/otp_screen.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final SignupController ctrl = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1F1F),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // BACK BUTTON
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 42,
                  height: 42,

                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white12),
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // TITLE
              const Text(
                'Create your account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'A few details to personalize your VABC.',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 40),

              // FULL NAME
              _InputField(
                controller: ctrl.fullNameController,
                hint: 'Full name',
                prefixIcon: Icons.person_outline,
              ),

              const SizedBox(height: 14),

              // EMAIL
              _InputField(
                controller: ctrl.emailController,
                hint: 'Email',
                prefixIcon: Icons.mail_outline,
              ),

              const SizedBox(height: 14),

              // PASSWORD
              Obx(
                () => _InputField(
                  controller: ctrl.passwordController,
                  hint: 'Password',
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

              const SizedBox(height: 14),

              // LANGUAGE DROPDOWNS
              Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => _DropdownField(
                        value: ctrl.primaryLanguage.value,

                        items: ctrl.languages,

                        onChanged: ctrl.changePrimaryLanguage,
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Obx(
                      () => _DropdownField(
                        value: ctrl.secondaryLanguage.value,

                        items: ctrl.languages,

                        onChanged: ctrl.changeSecondaryLanguage,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // TERMS
              Obx(
                () => GestureDetector(
                  onTap: ctrl.toggleAgreeTerms,

                  child: Row(
                    children: [
                      Container(
                        width: 18,
                        height: 18,

                        decoration: BoxDecoration(
                          color: ctrl.agreeTerms.value
                              ? const Color(0xFFFB923C)
                              : Colors.transparent,

                          borderRadius: BorderRadius.circular(6),

                          border: Border.all(color: const Color(0xFFFB923C)),
                        ),

                        child: ctrl.agreeTerms.value
                            ? const Icon(
                                Icons.check,
                                size: 14,
                                color: Colors.white,
                              )
                            : null,
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 13,
                            ),

                            children: const [
                              TextSpan(text: 'I agree to the '),

                              TextSpan(
                                text: 'Terms',
                                style: TextStyle(
                                  color: Color(0xFFFB923C),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              TextSpan(text: ' and Privacy Policy'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // CREATE ACCOUNT BUTTON
              Obx(
                () => GestureDetector(
                  onTap: ctrl.isLoading.value
                      ? null
                      : () async {
                          await ctrl.createAccount();

                          // Navigate to next page
                          Get.to(() => OtpScreen());
                        },

                  child: Container(
                    width: double.infinity,
                    height: 58,

                    decoration: BoxDecoration(
                      color: const Color(0xFFFF6B2C),

                      borderRadius: BorderRadius.circular(18),

                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF6B2C).withOpacity(0.5),

                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),

                    child: ctrl.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: const [
                              Text(
                                'Create Account',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                              SizedBox(width: 10),

                              Icon(Icons.arrow_forward, color: Colors.white),
                            ],
                          ),
                  ),
                ),
              ),

              const SizedBox(height: 140),

              // SIGN IN
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text(
                      'Already a member? ',
                      style: TextStyle(color: Colors.white.withOpacity(0.5)),
                    ),

                    GestureDetector(
                      onTap: () {
                        Get.to(LoginPage());
                      },

                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Color(0xFFFF6B2C),
                          fontWeight: FontWeight.w600,
                        ),
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
  final Widget? suffixIcon;

  const _InputField({
    required this.controller,
    required this.hint,
    required this.prefixIcon,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,

      decoration: BoxDecoration(
        color: const Color(0xFF333333),
        borderRadius: BorderRadius.circular(18),
      ),

      child: TextField(
        controller: controller,
        obscureText: obscureText,

        style: const TextStyle(color: Colors.white),

        decoration: InputDecoration(
          hintText: hint,

          hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),

          prefixIcon: Icon(prefixIcon, color: Colors.white38),

          suffixIcon: suffixIcon,

          border: InputBorder.none,
        ),
      ),
    );
  }
}

// DROPDOWN FIELD
class _DropdownField extends StatelessWidget {
  final String value;
  final List<String> items;
  final Function(String?) onChanged;

  const _DropdownField({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,

      padding: const EdgeInsets.symmetric(horizontal: 16),

      decoration: BoxDecoration(
        color: const Color(0xFF333333),
        borderRadius: BorderRadius.circular(18),
      ),

      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,

          dropdownColor: const Color(0xFF333333),

          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white38),

          style: const TextStyle(color: Colors.white),

          items: items.map((e) {
            return DropdownMenuItem(value: e, child: Text(e));
          }).toList(),

          onChanged: onChanged,
        ),
      ),
    );
  }
}
