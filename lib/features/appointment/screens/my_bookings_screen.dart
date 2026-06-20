import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medbridge_telemedicine/features/appointment/screens/consultation_history_screen.dart';

import '../../appointment/screens/prescription_screen.dart'; // ✅ ADD
import '../../call/screens/video_call_screen.dart'; // ✅ ADD
import 'package:medbridge_telemedicine/features/appointment/screens/health_record_screen.dart'; // ✅ ADD

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TITLE
              const Text(
                "My Bookings",
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              const Text(
                "Manage your clinical sessions and history.",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              /// TAB
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: const [
                    Expanded(
                      child: Center(
                        child: Text(
                          "Upcoming",
                          style: TextStyle(
                              color: Color(0xff2D5BFF),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text("Past"),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// NEXT APPOINTMENT
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Next Appointment",
                      style:
                      TextStyle(fontWeight: FontWeight.bold)),
                  Text("PRIORITY",
                      style: TextStyle(color: Colors.blue)),
                ],
              ),

              const SizedBox(height: 10),

              /// CARD
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [

                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                              "assets/images/doctor5.png"),
                        ),
                        const SizedBox(width: 10),

                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: const [
                            Text("Dr. Sarah Mitchell",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text("Senior Cardiologist",
                                style:
                                TextStyle(color: Colors.grey)),
                          ],
                        ),

                        const Spacer(),

                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius:
                            BorderRadius.circular(20),
                          ),
                          child: const Text("CONFIRMED",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.green)),
                        )
                      ],
                    ),

                    const SizedBox(height: 15),

                    Row(
                      children: [
                        Expanded(
                          child: _infoBox("Date", "Oct 24, 2023"),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _infoBox("Time", "10:30 AM"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color(0xff2D5BFF),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {
                              Get.to(() => const VideoCallScreen());
                            },
                            child: const Text("Join Call"),
                          ),
                        ),
                        const SizedBox(width: 10),

                        /// 🔥 ONLY THIS PART CHANGED
                        Expanded(
                          child: SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade200,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: () {
                                Get
                                    .to(() => const PrescriptionScreen()); // ✅ ADD
                              },
                              child: const Text(
                                "Reschedule",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// MORE
              const Text("More Scheduled",
                  style: TextStyle(fontWeight: FontWeight.bold)),

              const SizedBox(height: 10),

              _listTile("Health Records", "Oct 28 • 02:15 PM"),
              _listTile("Counseling Session", "Nov 02 • 09:00 AM"),

              const SizedBox(height: 20),

              const Text("Recently Completed",
                  style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),

      /// 🔥 BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: const Color(0xff2D5BFF),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: "Doctors"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Bookings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _infoBox(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value,
              style:
              const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _listTile(String title, String subtitle) {
    return GestureDetector(
      onTap: () {
        if (title == "Health Records") {
          Get.to(() => const HealthRecordsScreen()); // ✅ ADD
        } else if (title == "Counseling Session") {
          Get.to(() => const ConsultationHistoryScreen());
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.medical_services,
              color: Color(0xff2D5BFF),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}