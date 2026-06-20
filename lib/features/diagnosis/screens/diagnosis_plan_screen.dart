import 'package:flutter/material.dart';
import '../../activity/screens/recent_activity_screen.dart';

class DiagnosisPlanScreen extends StatefulWidget {
  const DiagnosisPlanScreen({super.key});

  @override
  State<DiagnosisPlanScreen> createState() => _DiagnosisPlanScreenState();
}

class _DiagnosisPlanScreenState extends State<DiagnosisPlanScreen> {

  final TextEditingController diagnosisController =
  TextEditingController(text: "Acute Seasonal Rhinitis");

  final TextEditingController planController = TextEditingController(
      text:
      "1. Medication: Loratadine 10mg once daily for 14 days.\n\n"
          "2. Nasal Care: Saline spray 3 times daily.\n\n"
          "3. Lifestyle: Increase hydration and avoid allergens.");

  bool isTemplate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                        AssetImage("assets/icons/user12.png"),
                      ),
                      SizedBox(width: 8),
                      Text("MedSanctuary",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Icon(Icons.notifications_none),
                ],
              ),

              const SizedBox(height: 20),

              /// PATIENT CARD
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [

                    /// 🔥 DOUBLE PROFILE IMAGE
                    /// 🔥 DOUBLE PROFILE IMAGE (FIXED)
                    SizedBox(
                      width: 52,
                      height: 52,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [

                          /// 👤 PATIENT IMAGE (MAIN BIG)
                          const Positioned(
                            left: 0,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundImage:
                              AssetImage("assets/images/doctor13.png"),
                            ),
                          ),

                          /// 👨‍⚕️ DOCTOR IMAGE (SMALL OVERLAY)
                          Positioned(
                            right: -2,
                            bottom: -2,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.white, // border effect
                                shape: BoxShape.circle,
                              ),
                              child: const CircleAvatar(
                                radius: 10,
                                backgroundImage:
                                AssetImage("assets/images/doctor13.png"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sarah Jenkins",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Consultation: Mar 24, 10:30 AM",
                              style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text("ACTIVE CASE",
                          style: TextStyle(fontSize: 10, color: Colors.green)),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 15),

              /// DIAGNOSIS
              const Text("DIAGNOSIS SUMMARY",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue)),

              const SizedBox(height: 8),

              TextField(
                controller: diagnosisController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),

              const SizedBox(height: 15),

              /// TITLE ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("DETAILED TREATMENT PLAN",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue)),

                  Row(
                    children: [
                      _chip("Template", isTemplate, () {
                        setState(() => isTemplate = true);
                      }),
                      const SizedBox(width: 6),
                      _chip("Voice", !isTemplate, () {
                        setState(() => isTemplate = false);
                      }),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 8),

              /// PLAN BOX
              Stack(
                children: [
                  TextField(
                    controller: planController,
                    maxLines: 8,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                    ),
                  ),

                  /// MIC + ADD BUTTON
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Row(
                      children: [

                        /// MIC
                        GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Voice input started...")),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.mic),
                          ),
                        ),

                        const SizedBox(width: 8),

                        /// ADD STEP
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              planController.text +=
                              "\n\nNew Step: Describe treatment...";
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Color(0xff2D5BFF),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              const SizedBox(height: 15),

              /// PRIORITY + VISIBILITY
              Row(
                children: [
                  Expanded(
                    child: _box("PRIORITY", "Standard"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _box("VISIBILITY", "Patient Only"),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// SEND BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RecentActivityScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2D5BFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Send to Patient"),
                ),
              ),

              const SizedBox(height: 5),

              const Center(
                child: Text(
                  "A copy will be saved to medical history automatically.",
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chip(String text, bool active, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: active ? const Color(0xff2D5BFF) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 10,
              color: active ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget _box(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(title,
              style: const TextStyle(fontSize: 10, color: Colors.grey)),
          const SizedBox(height: 5),
          Text(value,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}