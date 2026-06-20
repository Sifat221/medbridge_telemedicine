import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/screens/home_screen.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import '../../bookings/screens/my_bookings_screen.dart';
import 'my_bookings_screen.dart';

class AppointmentSuccessScreen extends StatelessWidget {
  const AppointmentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              const SizedBox(height: 20),

              /// ✅ SUCCESS ICON
              Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff4CD964),
                ),
                child: const Icon(Icons.check,
                    color: Colors.white, size: 40),
              ),

              const SizedBox(height: 20),

              const Text(
                "Appointment Confirmed!",
                style:
                TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text(
                "Your session with Dr. Aris Thorne has been successfully scheduled.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              /// CARD
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("CARDIOLOGIST",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.blue)),
                            Text("Dr. Aris Thorne",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text("✔ Verified Specialist",
                                style:
                                TextStyle(color: Colors.green)),
                          ],
                        )
                      ],
                    ),

                    const SizedBox(height: 15),

                    Row(
                      children: const [
                        Expanded(
                          child: _InfoBox(
                              title: "DATE",
                              value: "Oct 24, 2023"),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: _InfoBox(
                              title: "TIME",
                              value: "09:30 AM"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xffEEF3FF),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.location_on,
                              color: Color(0xff2D5BFF)),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              "Medical Center Plaza\nSuite 402, 128 Health Blvd",
                            ),
                          )
                        ],
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// QR
                    Center(
                      child: Container(
                        height: 120,
                        width: 120,
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.qr_code, size: 60),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Center(
                      child: Text("SHOW QR AT CHECK-IN",
                          style: TextStyle(fontSize: 10)),
                    ),

                    const SizedBox(height: 15),

                    /// 🔥 ONLY THIS PART CHANGED
                    GestureDetector(
                      onTap: () {
                        final event = Event(
                          title: 'Doctor Appointment',
                          description:
                          'Appointment with Dr. Aris Thorne',
                          location: 'Medical Center Plaza',
                          startDate:
                          DateTime(2023, 10, 24, 9, 30),
                          endDate:
                          DateTime(2023, 10, 24, 10, 0),
                        );

                        Add2Calendar.addEvent2Cal(event);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text("Add to Calendar"),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const Spacer(),

              /// 🔵 BUTTON
              /// 🔵 BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2D5BFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => const MyBookingsScreen()); // ✅ ONLY CHANGE
                  },
                  child: const Text("View My Bookings →"),
                ),
              ),

              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Get.offAll(() => const HomeScreen());
                },
                child: const Text("Go to Dashboard"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final String title;
  final String value;

  const _InfoBox({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 10, color: Colors.grey)),
          Text(value,
              style:
              const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}