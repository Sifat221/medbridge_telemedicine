import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medbridge_telemedicine/features/auth/screens/password_success_screen.dart';
import 'login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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

                /// 🔙 BACK
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back),
                ),

                const SizedBox(height: 20),

                /// ICON
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xff2D5BFF),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.lock_reset,
                      color: Colors.white, size: 28),
                ),

                const SizedBox(height: 25),

                /// TITLE
                const Text(
                  "Reset Password",
                  style: TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Create a new, strong password for your account",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 30),

                /// NEW PASSWORD
                const Text("New Password",
                    style: TextStyle(
                        color: Color(0xff2D5BFF),
                        fontWeight: FontWeight.w500)),

                const SizedBox(height: 8),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "••••••••",
                    prefixIcon: const Icon(Icons.key),
                    suffixIcon: const Icon(Icons.visibility),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// CONFIRM PASSWORD
                const Text("Confirm Password",
                    style: TextStyle(
                        color: Color(0xff2D5BFF),
                        fontWeight: FontWeight.w500)),

                const SizedBox(height: 8),

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "••••••••",
                    prefixIcon: const Icon(Icons.shield),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                /// SECURITY BOX
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [

                      Text(
                        "SECURITY REQUIREMENTS",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),

                      SizedBox(height: 10),

                      Row(
                        children: [
                          Icon(Icons.check_circle,
                              color: Colors.green, size: 18),
                          SizedBox(width: 6),
                          Text("At least 8 characters"),
                        ],
                      ),

                      SizedBox(height: 6),

                      Row(
                        children: [
                          Icon(Icons.check_circle,
                              color: Colors.green, size: 18),
                          SizedBox(width: 6),
                          Text("One special character"),
                        ],
                      ),

                      SizedBox(height: 6),

                      Row(
                        children: [
                          Icon(Icons.radio_button_unchecked,
                              size: 18),
                          SizedBox(width: 6),
                          Text("One uppercase letter"),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                /// BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2D5BFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => const PasswordSuccessScreen());// ✅ back login
                    },
                    child: const Text("Reset Password →"),
                  ),
                ),

                const SizedBox(height: 20),

                /// LOGIN TEXT
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Remember your password? "),
                    GestureDetector(
                      onTap: () {
                        Get.offAll(() =>  LoginScreen());
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          color: Color(0xff2D5BFF),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}