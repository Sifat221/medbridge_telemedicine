import 'package:flutter/material.dart';

class ViewDetailsScreen extends StatelessWidget {
  const ViewDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Appointment Details",
            style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Upcoming Check-up",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),

            SizedBox(height: 10),

            Text(
              "Your physical examination with Dr. Sarah Jenkins is scheduled for tomorrow at 10:30 AM.",
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 20),

            Text("Doctor: Dr. Sarah Jenkins"),
            Text("Date: Tomorrow"),
            Text("Time: 10:30 AM"),
            Text("Type: Physical Check-up"),
          ],
        ),
      ),
    );
  }
}