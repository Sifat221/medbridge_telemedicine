import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../prescription/screens/prescription_writing_screen.dart';

class BookingSuccessScreen extends StatelessWidget {
  const BookingSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage:
                        AssetImage("assets/icons/user11.png"),
                      ),
                      SizedBox(width: 8),
                      Text("MedSanctuary",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Icon(Icons.notifications_none),
                ],
              ),

              const SizedBox(height: 40),

              /// SUCCESS ICON
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.check,
                    color: Colors.green, size: 50),
              ),

              const SizedBox(height: 20),

              /// TITLE
              const Text(
                "Booking Confirmed",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 8),

              const Text(
                "Your appointment has been successfully scheduled.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 30),

              /// DETAILS CARD
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: const [

                    _info("Doctor", "Dr. Sarah Miller"),
                    _info("Date", "Wed, Sep 11"),
                    _info("Time", "10:00 AM"),
                    _info("Type", "Video Consultation"),

                  ],
                ),
              ),

              const Spacer(),

              /// BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => const PrescriptionWritingScreen()); // optional route
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2D5BFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("New Prescription "),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// INFO ROW
class _info extends StatelessWidget {
  final String title;
  final String value;

  const _info(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}