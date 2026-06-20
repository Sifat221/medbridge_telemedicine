import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../cases/screens/case_requests_screen.dart';

class DoctorDashboardScreen extends StatelessWidget {
  const DoctorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      body: SafeArea(
        child: SingleChildScrollView( // ✅ scroll added
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
                        AssetImage("assets/icons/user8.png"),
                      ),
                      SizedBox(width: 8),
                      Text("MedSanctuary",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Icon(Icons.notifications_none),
                ],
              ),

              const SizedBox(height: 20),

              /// TITLE
              const Text(
                "Good morning, Dr. Sarah Miller",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              const Text(
                "Your sanctuary for patient care is ready today.",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              /// BLUE CARD
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xff1E5BFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.description,
                            color: Colors.white),

                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            "ACTION REQUIRED",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10),
                          ),
                        )
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Text("12",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),

                    const Text("Pending Case Requests",
                        style: TextStyle(color: Colors.white70)),

                    const SizedBox(height: 10),

                    GestureDetector(
                      onTap: () {
                        Get.to(() => const CaseRequestsScreen()); // ✅ navigation
                      },
                      child: const Text(
                        "Quick View →",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// NEXT CONSULTATION
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.access_time, color: Colors.green),
                    SizedBox(height: 10),
                    Text("NEXT UP IN 15M",
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 5),
                    Text("Digital Consultation",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Patient: Marcus Thorne",
                        style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// TODAY APPOINTMENTS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Today's Appointments",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("View Schedule",
                      style: TextStyle(color: Colors.blue)),
                ],
              ),

              const SizedBox(height: 10),

              _appointment("09:30 AM", "Elena Richardson",
                  "Post-op follow-up • Office Visit"),
              _appointment("10:15 AM", "Marcus Thorne",
                  "Video Consult • Cardiac Rehab"),
              _appointment("11:00 AM", "James Wilson",
                  "New Referral • Initial Assess"),
              _appointment("01:45 PM", "Sofia Martinez",
                  "Lab Results Review • Remote"),

              const SizedBox(height: 20),

              /// WEEKLY OVERVIEW
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [

                    Row(
                      children: const [
                        Icon(Icons.show_chart, color: Colors.blue),
                        SizedBox(width: 10),
                        Text("Weekly Overview",
                            style: TextStyle(
                                fontWeight: FontWeight.bold)),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: const [
                        _stat("48", "Patients"),
                        _stat("92%", "Rate"),
                        _stat("12h", "Active"),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      /// BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xff2D5BFF),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Doctors"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _appointment(String time, String name, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(time,
                style: const TextStyle(fontSize: 10)),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(name,
                    style:
                    const TextStyle(fontWeight: FontWeight.bold)),
                Text(subtitle,
                    style:
                    const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 14)
        ],
      ),
    );
  }
}

class _stat extends StatelessWidget {
  final String value;
  final String label;
  const _stat(this.value, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontWeight: FontWeight.bold)),
        Text(label,
            style:
            const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}