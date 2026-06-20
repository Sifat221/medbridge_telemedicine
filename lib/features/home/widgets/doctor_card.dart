import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../doctor/screens/doctor_details_screen.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String image; // ✅ ADD THIS

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.image, // ✅ FIXED
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const DoctorDetailsScreen());
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [

            /// 👨‍⚕️ IMAGE (🔥 FIXED HERE)
            CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(image), // ✅ USE IMAGE
            ),

            const SizedBox(width: 12),

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    specialty,
                    style: const TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 6),

                  /// ⭐ RATING
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.orange, size: 16),
                      SizedBox(width: 4),
                      Text("4.9"),
                      SizedBox(width: 4),
                      Text("(124 reviews)",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),

                  const SizedBox(height: 6),

                  /// BOOK ROW
                  Row(
                    children: [
                      const Text(
                        "Available Today",
                        style: TextStyle(color: Colors.green),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xffE0E7FF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Book",
                          style: TextStyle(color: Color(0xff2D5BFF)),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}