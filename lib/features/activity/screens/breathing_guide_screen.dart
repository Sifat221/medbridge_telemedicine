import 'package:flutter/material.dart';

class BreathingGuideScreen extends StatefulWidget {
  const BreathingGuideScreen({super.key});

  @override
  State<BreathingGuideScreen> createState() =>
      _BreathingGuideScreenState();
}

class _BreathingGuideScreenState
    extends State<BreathingGuideScreen> {

  bool isRunning = false;
  bool inhale = true;

  double size = 200;

  void startSession() async {
    if (isRunning) return; // 🔥 prevent multiple tap

    setState(() {
      isRunning = true;
    });

    while (isRunning) {

      /// INHALE
      setState(() {
        inhale = true;
        size = 260;
      });
      await Future.delayed(const Duration(seconds: 3));

      /// EXHALE
      setState(() {
        inhale = false;
        size = 200;
      });
      await Future.delayed(const Duration(seconds: 3));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      body: SafeArea(
        child: Column(
          children: [

            /// HEADER
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      isRunning = false;
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Breathing Guide",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),

            const SizedBox(height: 30),

            /// ANIMATION CIRCLE
            Expanded(
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(seconds: 3),
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.shade200,
                  ),
                  child: Center(
                    child: Text(
                      inhale ? "Inhale" : "Exhale",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),

            /// BUTTON
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: startSession,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2D5BFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    isRunning
                        ? "Session Running..."
                        : "Start Session",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}