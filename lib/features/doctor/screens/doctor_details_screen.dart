import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../appointment/screens/availability_screen.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});

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

              /// 🔝 TOP BAR
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Text(
                    "MedBridge",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff2D5BFF),
                    ),
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 16,
                    backgroundImage:
                    AssetImage("assets/icons/user.png"),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.notifications_none),
                ],
              ),

              const SizedBox(height: 20),

              /// 👨‍⚕️ IMAGE CARD (🔥 FIXED)
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: SizedBox(
                      height: 280,
                      width: double.infinity,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          "assets/images/doctor3.png",
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.circle,
                              size: 10, color: Colors.white),
                          SizedBox(width: 5),
                          Text(
                            "AVAILABLE",
                            style: TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// TITLE
              const Text(
                "CARDIOLOGIST",
                style: TextStyle(
                    color: Color(0xff2D5BFF),
                    fontSize: 12,
                    fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 5),

              const Text(
                "Dr. Sarah Mitchell",
                style: TextStyle(
                    fontSize: 26, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              const Text(
                "Specializing in preventive cardiology and non-invasive cardiovascular imaging with over 12 years of clinical excellence.",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              /// BUTTONS
              /// BUTTONS
              Row(
                children: [
                  Expanded(
                    child: GestureDetector( // 🔥 ADD THIS
                      onTap: () {
                        Get.to(() => const AvailabilityScreen()); // 🔥 ADD THIS
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff1E5BFF),
                              Color(0xff4A7DFF)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            "Book Appointment →",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 10),

                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(Icons.chat_bubble_outline),
                  )
                ],
              ),
              const SizedBox(height: 20),

              /// STATS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _stat("1.2k+", "PATIENTS"),
                  _stat("12+", "EXPERIENCE"),
                  _stat("4.9 ★", "RATING"),
                  _stat("98%", "SUCCESS"),
                ],
              ),

              const SizedBox(height: 25),

              /// EXPERIENCE
              const Text(
                "Clinical Experience",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              _experience(
                  "Senior Cardiologist",
                  "Metro Heart Institute • 2018 - Present"),
              _experience(
                  "Cardiology Resident",
                  "City General Hospital • 2012 - 2018"),

              const SizedBox(height: 20),

              /// REVIEWS (🔥 UPDATED)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Patient Reviews",
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),
                  Text("See All",
                      style: TextStyle(color: Color(0xff2D5BFF))),
                ],
              ),

              const SizedBox(height: 10),

              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.grey,
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("James Wilson",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text("2 DAYS AGO",
                                  style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey)),
                            ],
                          ),

                          const SizedBox(height: 4),

                          Row(
                            children: List.generate(
                              5,
                                  (index) => const Icon(Icons.star,
                                  size: 14,
                                  color: Colors.orange),
                            ),
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            "“Dr. Mitchell is incredibly thorough and took the time to explain everything clearly. I felt heard and cared for throughout my entire consultation.”",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 25),

              /// EDUCATION
              const Text("Education",
                  style:
                  TextStyle(fontWeight: FontWeight.bold)),

              const SizedBox(height: 10),

              _edu("MD in Cardiology", "Stanford Medical School"),
              _edu("Fellowship in Imaging", "Johns Hopkins University"),

              const SizedBox(height: 20),

              /// SPECIALIZATION
              const Text("Specializations",
                  style:
                  TextStyle(fontWeight: FontWeight.bold)),

              const SizedBox(height: 10),

              Wrap(
                spacing: 10,
                children: const [
                  Chip(label: Text("Heart Failure")),
                  Chip(label: Text("Echocardiography")),
                  Chip(label: Text("Prevention")),
                  Chip(label: Text("Hypertension")),
                ],
              ),

              const SizedBox(height: 20),

              /// LOCATION (🔥 UPDATED)
              const Text("Location",
                  style:
                  TextStyle(fontWeight: FontWeight.bold)),

              const SizedBox(height: 10),

              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/map.png",
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "124 Healthcare Ave, Suite 305, Medical District, SF",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _stat(String value, String label) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(
                fontWeight: FontWeight.bold)),
        Text(label,
            style: const TextStyle(
                fontSize: 10, color: Colors.grey)),
      ],
    );
  }

  Widget _experience(String title, String sub) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.work),
      title: Text(title),
      subtitle: Text(sub),
    );
  }


  Widget _edu(String title, String sub) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.school),
      title: Text(title),
      subtitle: Text(sub),
    );

  }
}