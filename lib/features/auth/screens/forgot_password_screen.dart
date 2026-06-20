import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medbridge_telemedicine/features/auth/screens/reset_password_screen.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_textfield.dart';
import 'login_screen.dart';
import 'verify_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// 🔙 BACK BUTTON
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),

                const SizedBox(height: 20),

                /// TITLE
                const Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 10),

                const Text(
                  "Enter your email to receive a reset link.",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 40),

                /// EMAIL
                const Text("Email Address",
                    style: TextStyle(
                        color: Color(0xff2D5BFF),
                        fontWeight: FontWeight.w500)),

                const SizedBox(height: 8),

                const CustomTextField(
                  hint: "name@example.com",
                  icon: Icons.email,
                ),

                const SizedBox(height: 30),

                /// BUTTON → VERIFY PAGE
                CustomButton(
                  text: "Send Reset Link",
                  onTap: () {
                    Get.to(() => const ResetPasswordScreen()); // ✅ VERIFY
                  },
                ),

                const SizedBox(height: 25),

                /// LOGIN TEXT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Remember your password? "),
                    GestureDetector(
                      onTap: () {
                        Get.to(() =>  LoginScreen()); // ✅ LOGIN
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          color: Color(0xff2D5BFF),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                /// OPTIONAL HELP CARD (UI MATCH)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.support_agent, color: Color(0xff2D5BFF)),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Need help?",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Contact our support sanctuary",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}