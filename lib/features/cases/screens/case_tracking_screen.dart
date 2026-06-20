import 'package:flutter/material.dart';
import '../../cases/screens/case_details_screen.dart';
import 'package:get/get.dart';

class CaseTrackingScreen extends StatelessWidget {
  const CaseTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      body: SafeArea(
        child: Padding(
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
                        radius: 18,
                        backgroundImage:
                        AssetImage("assets/icons/user4.png"),
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
                "Case Tracking",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              const Text("Case ID: #MS-88291 • Today"),

              const SizedBox(height: 20),

              /// STEPS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.check_circle, color: Colors.blue),
                  Icon(Icons.check_circle, color: Colors.blue),
                  Icon(Icons.check_circle, color: Colors.blue),
                  Icon(Icons.radio_button_unchecked),
                ],
              ),

              const SizedBox(height: 20),

              /// MAIN CARD
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff2D5BFF), Color(0xff1E3FA8)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Diagnosis Ready",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text(
                      "Dr. Julian Thorne has completed your initial assessment. Review your diagnosis details below.",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              /// ✅ ADDED BUTTON (View Assessment Result)
              GestureDetector(
                onTap: () {
                  Get.to(() => const CaseDetailsScreen());
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text("View Assessment Result →"),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              /// DOCTOR
              const ListTile(
                leading: CircleAvatar(),
                title: Text("Dr. Julian Thorne"),
                subtitle: Text("Senior Orthopedic Specialist"),
              ),

              const SizedBox(height: 10),

              /// FILES
              const ListTile(
                leading: Icon(Icons.insert_drive_file),
                title: Text("Case Files Uploaded"),
                subtitle: Text("3 medical images, History PDF"),
              ),

              const SizedBox(height: 10),

              /// TREATMENT
              const ListTile(
                leading: Icon(Icons.healing),
                title: Text("Treatment Plan"),
                subtitle: Text("Estimated wait: 2-4 hours"),
              ),

              const Spacer(),

              /// BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2D5BFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Need help with this case?"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}