import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../activity/screens/breathing_guide_screen.dart';
import '../../profile/screens/profile_screen.dart'; // ✅ ADD
import '../../activity/screens/view_details_screen.dart';
import '../controllers/activity_controller.dart';

class RecentActivityScreen extends StatelessWidget {
  const RecentActivityScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ActivityController());
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
                        AssetImage("assets/icons/user13.png"),
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

              const Text(
                "Recent Activity",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              const Text(
                "Stay updated with your healthcare journey.",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  _filterBtn("All", true),
                  _filterBtn("Appointments", false),
                  _filterBtn("Cases", false),
                ],
              ),

              const SizedBox(height: 20),

              const Text("APPOINTMENTS",
                  style: TextStyle(fontSize: 10, color: Colors.grey)),

              const SizedBox(height: 10),

              _activityCard(
                context,
                icon: Icons.calendar_today,
                title: "Upcoming Check-up",
                subtitle:
                "Your physical examination with Dr. Sarah Jenkins is scheduled for tomorrow at 10:30 AM.",
                time: "2H AGO",
                button1: "View Details",
                button2: "Reschedule",
              ),

              _activityCard(
                context,
                icon: Icons.check_circle,
                title: "Booking Confirmed",
                subtitle:
                "Cardiology consultation with Dr. Mark Harris has been successfully booked for Friday, Oct 12.",
                time: "5H AGO",
                isSuccess: true,
              ),

              const SizedBox(height: 15),

              const Text("CASES",
                  style: TextStyle(fontSize: 10, color: Colors.grey)),

              const SizedBox(height: 10),

              _activityCard(
                context,
                icon: Icons.description,
                title: "Lab Results Ready",
                subtitle:
                "Your Blood Panel (Case #8821) has been processed.",
                time: "YESTERDAY",
                link: "Listen to Voice Note",
              ),

              _activityCard(
                context,
                icon: Icons.file_copy,
                title: "Prescription Renewal",
                subtitle:
                "Your request has been approved.",
                time: "OCT 08",
              ),

              const SizedBox(height: 15),

              const Text("SYSTEM",
                  style: TextStyle(fontSize: 10, color: Colors.grey)),

              const SizedBox(height: 10),

              _activityCard(
                context,
                icon: Icons.security,
                title: "New Login Detected",
                subtitle:
                "A new login was detected.",
                time: "OCT 05",
              ),

              const SizedBox(height: 20),

              /// INSIGHT CARD
              Container(
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xff2D5BFF), Color(0xff1E3FA8)],
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("DAILY INSIGHT",
                                style: TextStyle(color: Colors.white70)),
                            const SizedBox(height: 6),
                            const Text("Focus on\nDeep Breathing",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 6),
                            const Text(
                              "5 minutes breathing reduces stress.",
                              style: TextStyle(color: Colors.white70),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                    const BreathingGuideScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14, vertical: 8),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(20),
                                ),
                                child: const Text("Learn Techniques"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset("assets/images/yoga.png",
                        width: 120, fit: BoxFit.cover),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// 🔥 PROFILE NAVIGATION ADDED
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ProfileScreen(),
              ),
            );
          }
        },
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

  Widget _filterBtn(String text, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding:
      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: active ? const Color(0xff2D5BFF) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: active ? Colors.white : Colors.black,
          fontSize: 12,
        ),
      ),
    );
  }

  /// ACTIVITY CARD
  Widget _activityCard(BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String time,
    bool isSuccess = false,
    String? button1,
    String? button2,
    String? link,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// ICON
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isSuccess
                  ? Colors.green.shade100
                  : Colors.grey.shade200,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 18,
              color: isSuccess ? Colors.green : Colors.black,
            ),
          ),

          const SizedBox(width: 10),

          /// TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                Text(
                  subtitle,
                  style: const TextStyle(
                      fontSize: 12, color: Colors.grey),
                ),

                /// BUTTONS
                if (button1 != null) ...[
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ViewDetailsScreen(),
                            ),
                          );
                        },
                        child: _smallBtn(button1),
                      ),

                      if (button2 != null) ...[
                        const SizedBox(width: 8),
                        _smallBtn(button2),
                      ]
                    ],
                  )
                ],

                /// LINK
                if (link != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    link,
                    style: const TextStyle(
                      color: Color(0xff2D5BFF),
                      fontSize: 12,
                    ),
                  )
                ]
              ],
            ),
          )
        ],
      ),
    );
  }

  /// SMALL BUTTON
  Widget _smallBtn(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 10),
      ),
    );
  }
}