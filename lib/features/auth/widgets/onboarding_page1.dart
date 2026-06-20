import 'package:flutter/material.dart';

class OnboardingPage1 extends StatelessWidget {
  final int currentIndex;

  const OnboardingPage1({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [

        const SizedBox(height: 10),

        /// 🔥 IMAGE
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: height * 0.35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Image.asset(
                "assets/images/on1.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        const SizedBox(height: 24),

        /// 📝 TITLE
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            "Manage Health Records.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        const SizedBox(height: 10),

        /// 📝 SUBTITLE
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 28),
          child: Text(
            "Securely store and share your medical history with healthcare providers.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),

        const SizedBox(height: 20),

        /// 🔘 DOT INDICATOR (🔥 NEW ADD)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3, // ✅ FIXED
                (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 6,
              width: currentIndex == index ? 24 : 6,
              decoration: BoxDecoration(
                color: currentIndex == index
                    ? const Color(0xff2D5BFF)
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}