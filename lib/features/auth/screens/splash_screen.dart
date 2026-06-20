import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _handleNavigation();
  }

  Future<void> _handleNavigation() async {
    await Future.delayed(const Duration(seconds: 3));
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    if (!mounted) return;

    if (token != null && token.isNotEmpty) {
      Get.offAllNamed('/home');
      return;
    }

    Get.offAllNamed('/onboarding');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// 🔥 BACKGROUND GRADIENT
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFF5F7FA),
                  Color(0xFFEFF7F1),
                  Color(0xFFE8F5EC),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          /// ⭐ TOP LEFT STAR (FIXED PATH)
          /// ⭐ STAR
          /// ⭐ STAR
          Positioned(
            top: 20,
            left: -40, // 🔥 more outside
            child: Opacity(
              opacity: 0.25,
              child: Image.asset(
                "assets/icons/bg_star.png",
                width: 300, // 🚀 MAX SAFE
                color: Colors.grey.shade300,
              ),
            ),
          ),

          Positioned(
            bottom: 20,
            right: -50, // 🔥 বাইরে বের হবে
            child: Opacity(
              opacity: 0.25,
              child: Image.asset(
                "assets/icons/bg_medical.png",
                width: 320, // 🚀 MAX SAFE
                color: Colors.grey.shade300,
              ),
            ),
          ),
          /// 🔥 MAIN CONTENT
          Column(
            children: [

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    /// LOGO
                    Container(
                      height: 95,
                      width: 95,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF2F80ED),
                            Color(0xFF1C5FD4),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            blurRadius: 30,
                            offset: const Offset(0, 15),
                          )
                        ],
                      ),
                      child: const Icon(
                        Icons.health_and_safety,
                        color: Colors.white,
                        size: 42,
                      ),
                    ),

                    const SizedBox(height: 24),

                    /// TITLE
                    const Text(
                      "MedBridge",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1C5FD4),
                      ),
                    ),

                    const SizedBox(height: 6),

                    /// SUBTITLE
                    const Text(
                      "Empowering Your Health Journey",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF2E7D32),
                      ),
                    ),

                    const SizedBox(height: 36),

                    /// DOTS
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _dot(true),
                        _dot(false),
                        _dot(false),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// DESCRIPTION
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        "Bridging the gap between expert clinical care and your daily wellness.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// 🔒 SECURE TEXT (FIXED)
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Image.asset(
                      "assets/icons/secure.png",
                      height: 18,
                    ),

                    const SizedBox(width: 8),

                    const Text(
                      "SECURE PROFESSIONAL NETWORK",
                      style: TextStyle(
                        fontSize: 11,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dot(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 6,
      width: active ? 18 : 6,
      decoration: BoxDecoration(
        color: active ? const Color(0xFF1C5FD4) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}