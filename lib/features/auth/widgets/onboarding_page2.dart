import 'package:flutter/material.dart';

class OnboardingPage2 extends StatelessWidget {
  final int currentIndex;

  const OnboardingPage2({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      children: [

        /// IMAGE
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            height: height * 0.38,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: Image.asset(
                "assets/images/on2.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        const SizedBox(height: 24),

        /// TITLE
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children: [
                TextSpan(text: "Consult "),
                TextSpan(
                  text: "Specialists",
                  style: TextStyle(color: Color(0xff2D5BFF)),
                ),
                TextSpan(text: "\nOnline"),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Connect with expert doctors from the comfort of your home.",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ),

        const SizedBox(height: 20),

        /// 🔘 DOTS (🔥 ADDED)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
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