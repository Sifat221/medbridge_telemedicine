import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/screens/home_screen.dart';
import 'doctor_details_screen.dart'; // ✅ ADD THIS

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

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

            GestureDetector(
              onTap: () {
                Get.offAll(() => const HomeScreen());
              },
              child: const Icon(Icons.home, color: Colors.grey),
            ),

            GestureDetector(
              onTap: () {},
              child: const Icon(Icons.search, color: Color(0xff2D5BFF)),
            ),

            const Icon(Icons.calendar_today, color: Colors.grey),
            const Icon(Icons.chat_bubble_outline, color: Colors.grey),
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
                    children: [
                      const CircleAvatar(
                        radius: 22,
                        backgroundImage:
                        AssetImage("assets/icons/user.png"),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "MedBridge",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2D5BFF),
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

              const Text(
                "Find Expertise",
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 6),

              const Text(
                "Access world-class specialists tailored to your specific care needs.",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

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
                          hintText: "Search doctors, clinics...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(Icons.tune, color: Colors.grey.shade600),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              Row(
                children: [
                  _filter("Specialty", true),
                  _filter("Rating", false),
                  _filter("Distance", false),
                ],
              ),

              const SizedBox(height: 20),

              _doctorCard(
                image: "assets/images/doctor1.png",
                name: "Dr. Marcus Thorne",
                role: "Senior Cardiologist",
                exp: "12 yrs exp.",
                distance: "2.4 km away",
                rating: "4.9",
                available: "Available Today",
                isAvailable: true,
              ),

              _doctorCard(
                image: "assets/images/doctor2.png",
                name: "Dr. Sarah Jenkins",
                role: "Neurologist",
                exp: "8 yrs exp.",
                distance: "5.1 km away",
                rating: "4.8",
                available: "Available Tomorrow",
                isAvailable: true,
              ),

              _doctorCard(
                image: "assets/images/doctor3.png",
                name: "Dr. Elena Rodriguez",
                role: "Pediatrician",
                exp: "15 yrs exp.",
                distance: "0.8 km away",
                rating: "5.0",
                available: "Fully Booked",
                isAvailable: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// FILTER
  Widget _filter(String text, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: active ? const Color(0xff2D5BFF) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            text == "Specialty"
                ? Icons.tune
                : text == "Rating"
                ? Icons.star_border
                : Icons.location_on_outlined,
            size: 16,
            color: active ? Colors.white : Colors.black,
          ),
          const SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              color: active ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  /// DOCTOR CARD (🔥 ONLY CHANGE HERE)
  Widget _doctorCard({
    required String image,
    required String name,
    required String role,
    required String exp,
    required String distance,
    required String rating,
    required String available,
    required bool isAvailable,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.asset(image, fit: BoxFit.cover),
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,
                  style:
                  const TextStyle(fontWeight: FontWeight.bold)),
              Row(
                children: [
                  const Icon(Icons.star,
                      size: 14, color: Colors.orange),
                  const SizedBox(width: 3),
                  Text(rating),
                ],
              )
            ],
          ),

          const SizedBox(height: 4),

          Text(role,
              style: const TextStyle(
                  color: Color(0xff2D5BFF),
                  fontWeight: FontWeight.w500)),

          const SizedBox(height: 6),

          Row(
            children: [
              const Icon(Icons.work_outline,
                  size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(exp),
              const SizedBox(width: 10),
              const Icon(Icons.location_on_outlined,
                  size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(distance),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.circle,
                      size: 10,
                      color: isAvailable
                          ? Colors.green
                          : Colors.red),
                  const SizedBox(width: 6),
                  Text(
                    available,
                    style: TextStyle(
                      color: isAvailable
                          ? Colors.green
                          : Colors.red,
                    ),
                  ),
                ],
              ),

              /// 🔥 ONLY THIS ADDED
              GestureDetector(
                onTap: () {
                  Get.to(() => const DoctorDetailsScreen());
                },
                child: const Text(
                  "View Profile",
                  style: TextStyle(color: Color(0xff2D5BFF)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}