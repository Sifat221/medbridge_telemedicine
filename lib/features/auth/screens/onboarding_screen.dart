import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/onboarding_model.dart';
import '../../../core/constants/app_colors.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

// 👉 IMPORT PAGES
import '../widgets/onboarding_page1.dart';
import '../widgets/onboarding_page2.dart';
import '../widgets/onboarding_page3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [

            /// 🔝 TOP BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  /// MedBridge (ONLY PAGE 2)
                  currentIndex == 1
                      ? const Text(
                    "MedBridge",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2D5BFF),
                    ),
                  )
                      : const SizedBox(),

                  /// SKIP → Signup
                  TextButton(
                    onPressed: () {
                      Get.offAll(() => const SignupScreen()); // ✅ FIXED
                    },
                    child: const Text("Skip"),
                  ),
                ],
              ),
            ),

            /// 📱 PAGE VIEW
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => currentIndex = index);
                },
                children: [
                  OnboardingPage1(currentIndex: currentIndex),
                  OnboardingPage2(currentIndex: currentIndex),
                  OnboardingPage3(currentIndex: currentIndex),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// 🔵 BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    if (currentIndex == 2) {
                      Get.offAll(() => const SignupScreen()); // ✅ FIXED
                    } else {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Text(
                    currentIndex == 2 ? "Get Started" : "Next →",
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// 🔗 LOGIN TEXT (ONLY LAST PAGE)
            if (currentIndex == 2)
              GestureDetector(
                onTap: () {
                  Get.to(() =>  LoginScreen()); // ✅ LOGIN
                },
                child: const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text.rich(
                    TextSpan(
                      text: "Already part of MedBridge? ",
                      children: [
                        TextSpan(
                          text: "Log In",
                          style: TextStyle(
                            color: Color(0xff2D5BFF),
                            fontWeight: FontWeight.w500,
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
    );
  }
}