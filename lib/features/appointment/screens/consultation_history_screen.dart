import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medbridge_telemedicine/features/appointment/screens/prescription_screen.dart';

// SAME IMPORT
import '../../prescription/screens/prescription_screen.dart';
import '../../chat/screens/chat_screen.dart';

// ONLY ADD
import '../../reports/screens/report_screen.dart';
import '../../timeline/screens/health_timeline_screen.dart';
import 'health_timeline_screen.dart';
import 'package:medbridge_telemedicine/features/appointment/screens/symptoms_screen.dart';


class ConsultationHistoryScreen extends StatelessWidget {
  const ConsultationHistoryScreen({super.key});

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
                        AssetImage("assets/icons/user4.png"),
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

              const Text(
                "Consultation History",
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              const Text(
                "Review your past medical interactions and digital prescriptions.",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              /// SEARCH
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.search),
                          hintText: "Search doctors or symptoms...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.tune),
                  )
                ],
              ),

              const SizedBox(height: 20),

              _card1(),
              const SizedBox(height: 15),
              _card2(),
              const SizedBox(height: 15),
              _card3(),

              const SizedBox(height: 20),

              /// SHOW MORE (ADD)
              Center(
                child: TextButton(
                  onPressed: () {
                    Get.to(() => const HealthTimelineScreen());
                  },
                  child: const Text("Show more records"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// CARD 1
  Widget _card1() {
    return _container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              const CircleAvatar(
                backgroundImage:
                AssetImage("assets/images/doctor8.png"),
              ),
              const SizedBox(width: 10),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dr. Aris Thorne",
                        style:
                        TextStyle(fontWeight: FontWeight.bold)),
                    Text("Senior Cardiologist",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

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

          const Text("📹 VIDEO CALL",
              style: TextStyle(color: Colors.blue)),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Date\nOct 24, 2023"),
              Text("Duration\n24 Minutes"),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const PrescriptionScreen()); // ADD
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2D5BFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("View Prescription"),
                ),
              ),
              const SizedBox(width: 10),

              GestureDetector(
                onTap: () {
                  Get.to(() => const SymptomsScreen()); // ✅ NEW
                },
                child: const Chip(label: Text("Symptoms")),
              )
            ],
          )
        ],
      ),
    );
  }

  /// CARD 2
  Widget _card2() {
    return _container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              const CircleAvatar(
                backgroundImage:
                AssetImage("assets/images/doctor9.png"),
              ),
              const SizedBox(width: 10),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dr. Sarah Jenkins",
                        style:
                        TextStyle(fontWeight: FontWeight.bold)),
                    Text("Dermatologist",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("FOLLOW-UP",
                    style: TextStyle(
                        fontSize: 10, color: Colors.blue)),
              )
            ],
          ),

          const SizedBox(height: 10),

          const Text("💬 CHAT SESSION",
              style: TextStyle(color: Colors.green)),

          const SizedBox(height: 10),

          const Text("Date: Oct 18, 2023\nMessages: 42 Exchange"),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {
              Get.to(() => const ChatScreen()); // ADD
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade300,
            ),
            child: const Text("View Chat History",
                style: TextStyle(color: Colors.black)),
          )
        ],
      ),
    );
  }

  /// CARD 3
  Widget _card3() {
    return _container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              const CircleAvatar(
                backgroundImage:
                AssetImage("assets/images/doctor10.png"),
              ),
              const SizedBox(width: 10),

              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dr. Michael Chen",
                        style:
                        TextStyle(fontWeight: FontWeight.bold)),
                    Text("General Practitioner",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

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

          const Text("URGENT CARE",
              style: TextStyle(color: Colors.red)),

          const SizedBox(height: 10),

          const Text("Date: Sept 30, 2023\nDuration: 15 Minutes"),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {
              Get.to(() => const ReportScreen()); // ADD
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff2D5BFF),
            ),
            child: const Text("Download Report"),
          )
        ],
      ),
    );
  }

  Widget _container({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}