import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../doctor/screens/doctors_screen.dart';

import '../widgets/category_card.dart';
import '../widgets/doctor_card.dart';

import '../../appointment/screens/my_bookings_screen.dart';
import '../../chat/screens/chat_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      /// 🔽 BOTTOM NAV
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            /// 🏠 HOME
            const Icon(Icons.home, color: Color(0xff2D5BFF)),

            /// 🔍 DOCTORS
            GestureDetector(
              onTap: () {
                Get.offAll(() => const DoctorsScreen());
              },
              child: const Icon(Icons.search, color: Colors.grey),
            ),

            /// 📅 BOOKINGS
            GestureDetector(
              onTap: () {
                Get.to(() => const MyBookingsScreen());
              },
              child: const Icon(Icons.calendar_today, color: Colors.grey),
            ),

            /// 💬 CHAT (🔥 ONLY ADD)
            GestureDetector(
              onTap: () {
                Get.to(() => const ChatScreen());
              },
              child: const Icon(Icons.chat_bubble_outline, color: Colors.grey),
            ),

            /// 👤 PROFILE
            const Icon(Icons.person_outline, color: Colors.grey),
          ],
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
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
                        radius: 22,
                        backgroundImage:
                        AssetImage("assets/icons/user.png"),
                      ),
                      SizedBox(width: 10),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Welcome back,\n",
                              style: TextStyle(fontSize: 14),
                            ),
                            TextSpan(
                              text: "MedBridge",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff2D5BFF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade200,
                    child: const Icon(Icons.notifications_none),
                  )
                ],
              ),

              const SizedBox(height: 20),

              /// SEARCH
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search for doctors, symptoms...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.tune, color: Colors.grey.shade600),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// UPCOMING
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Upcoming Appointment",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(color: Color(0xff2D5BFF)),
                  )
                ],
              ),

              const SizedBox(height: 15),

              /// CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xff1E5BFF),
                      Color(0xff4A7DFF),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundImage:
                          AssetImage("assets/images/on4.png"),
                        ),
                        const SizedBox(width: 14),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dr. Marcus\nRodriguez",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 6),
                              Text(
                                "Cardiologist •\nHeart Clinic",
                                style: TextStyle(color: Colors.white70),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text("CONFIRMED"),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.calendar_today,
                                  color: Colors.white, size: 16),
                              SizedBox(width: 8),
                              Text("Tue, Oct 24",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.access_time,
                                  color: Colors.white, size: 16),
                              SizedBox(width: 8),
                              Text("10:30 AM - 11:00 AM",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// CATEGORIES
              const Text(
                "Categories",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CategoryCard(title: "General", icon: Icons.medical_services),
                  CategoryCard(title: "Cardiology", icon: Icons.favorite),
                  CategoryCard(title: "Dental", icon: Icons.medical_services),
                  CategoryCard(title: "Eye Care", icon: Icons.visibility),
                ],
              ),

              const SizedBox(height: 25),

              /// DOCTORS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Top Doctors",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "View all",
                    style: TextStyle(color: Color(0xff2D5BFF)),
                  )
                ],
              ),

              const SizedBox(height: 15),

              const DoctorCard(
                name: "Dr. Sarah Jenkins",
                specialty: "Internal Medicine",
                image: "assets/images/doctor.png",
              ),

              const SizedBox(height: 15),

              const DoctorCard(
                name: "Dr. John Smith",
                specialty: "Dentist",
                image: "assets/images/doctor.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}