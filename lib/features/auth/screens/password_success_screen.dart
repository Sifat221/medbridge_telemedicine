import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_screen.dart';

class PasswordSuccessScreen extends StatelessWidget {
  const PasswordSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// LOGO
              const Text(
                "MedSanctuary",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff2D5BFF),
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 40),

              /// SUCCESS ICON
              Stack(
                alignment: Alignment.center,
                children: [

                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                  const Icon(Icons.check_circle,
                      color: Colors.green, size: 60),

                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xff2D5BFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.verified,
                          color: Colors.white, size: 18),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              /// TITLE
              const Text(
                "Password Reset!",
                style: TextStyle(
                    fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              const Text(
                "Your password has been successfully updated.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 40),

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
                    Get.offAll(() =>  LoginScreen()); // ✅ LOGIN
                  },
                  child: const Text("Back to Login →"),
                ),
              ),

              const SizedBox(height: 20),

              /// SECURE TEXT
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.circle, size: 10, color: Colors.green),
                    SizedBox(width: 6),
                    Text("SECURE CONNECTION ACTIVE",
                        style: TextStyle(fontSize: 12)),
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