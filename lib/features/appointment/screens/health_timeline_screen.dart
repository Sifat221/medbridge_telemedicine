import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ✅ ADD THIS IMPORT
import '../../appointment/screens/consultation_history_screen.dart';

class HealthTimelineScreen extends StatelessWidget {
  const HealthTimelineScreen({super.key});

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
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage:
                        AssetImage("assets/icons/user2.png"),
                      ),
                      SizedBox(width: 8),
                      Text("MedSanctuary",
                          style: TextStyle(
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Icon(Icons.notifications_none),
                ],
              ),

              const SizedBox(height: 20),

              /// TITLE
              const Text(
                "Health Timeline",
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              const Text(
                "Your complete medical journey, synchronized and verified.",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              /// TIMELINE ITEM 1
              _timelineItem(
                date: "Oct 24, 2023",
                title: "Consultation with Dr. Aris Thorne",
                subtitle:
                "General Cardiology Checkup and Stress Test Review.",
                isCompleted: true,
              ),

              const SizedBox(height: 15),

              /// TIMELINE ITEM 2
              _timelineItem(
                date: "Oct 15, 2023",
                title: "Lab Test: Blood Work",
                subtitle:
                "Comprehensive Metabolic Panel & Lipid Profile.",
                isCompleted: false,
              ),

              const SizedBox(height: 15),

              /// TIMELINE ITEM 3
              _timelineItem(
                date: "Oct 10, 2023",
                title: "Prescription Refill",
                subtitle:
                "Lisinopril 10mg • 30 Day Supply.",
                isCompleted: false,
              ),

              const SizedBox(height: 20),

              const Center(
                child: Text(
                  "Loading older medical records...",
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _timelineItem({
    required String date,
    required String title,
    required String subtitle,
    required bool isCompleted,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(date,
                  style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold)),
              if (isCompleted)
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text("COMPLETED",
                      style: TextStyle(
                          fontSize: 10, color: Colors.green)),
                )
            ],
          ),

          const SizedBox(height: 10),

          Text(title,
              style:
              const TextStyle(fontWeight: FontWeight.bold)),

          const SizedBox(height: 5),

          Text(subtitle,
              style: const TextStyle(color: Colors.grey)),

          const SizedBox(height: 10),

          /// 🔥 ONLY ADD THIS PART
          GestureDetector(
            onTap: () {
              Get.to(() => const ConsultationHistoryScreen());
            },
            child: const Text(
              "View Doctor's Summary",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 13,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}