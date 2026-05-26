// lib/pages/forgot_password_page.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vabc_app/screens/forgot_pass_page/forgot_password_controller.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.put(ForgotPasswordController());

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Back button ─────────────────────────────────────────────
              GestureDetector(
                onTap: ctrl.backToSignIn,
                child: Container(
                  width: 40,
                  height: 40,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFFF6B2C).withOpacity(0.4),
                    ),
                    color: const Color(0xFFFF6B2C).withOpacity(0.08),
                  ),

                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // ── Key icon ────────────────────────────────────────────────
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFFFF6B2C).withOpacity(0.4),
                  ),
                  color: const Color(0xFFFF6B2C).withOpacity(0.08),
                ),
                child: Center(
                  child: Container(
                    width: 24,
                    height: 24,
                    child: Image.asset(
                      'assets/images/key.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 28),

              // ── Title ────────────────────────────────────────────────────
              Text(
                'Forgot password?',
                style: GoogleFonts.sora(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 10),

              // ── Subtitle ─────────────────────────────────────────────────
              Text(
                "Enter your email and we'll send a secure reset link.",
                style: GoogleFonts.sora(
                  color: Colors.white.withOpacity(0.50),
                  fontSize: 13,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 36),

              // ── Email field ──────────────────────────────────────────────
              Container(
                height: 54,
                decoration: BoxDecoration(
                  color: const Color(0xFF2A2A2A),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TextField(
                  controller: ctrl.emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'alex@vabc.ai',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.30)),
                    prefixIcon: const Icon(
                      Icons.mail_outline,
                      color: Colors.white38,
                      size: 20,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ── Send Reset Link button ───────────────────────────────────
              Obx(
                () => GestureDetector(
                  onTap: ctrl.isLoading.value ? null : ctrl.sendResetLink,
                  child: Container(
                    width: double.infinity,
                    height: 54,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE85D20),
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE85D20).withOpacity(0.40),
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
                        : Center(
                            child: Text(
                              'Send Reset Link',
                              style: GoogleFonts.sora(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.14,
                              ),
                            ),
                          ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // ── Back to sign in ──────────────────────────────────────────
              Center(
                child: GestureDetector(
                  onTap: ctrl.backToSignIn,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.45),
                      ),
                      children: [
                        TextSpan(text: 'Remembered it? '),
                        TextSpan(
                          text: 'Back to sign in',
                          style: GoogleFonts.sora(
                            color: Color(0xFFE85D20),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
