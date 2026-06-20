import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../vitals/screens/vitals_input_screen.dart';
import '../../reports/screens/upload_reports_screen.dart';
import '../../cases/screens/case_tracking_screen.dart';

class NewPatientCaseScreen extends StatelessWidget {
  const NewPatientCaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage:
                        AssetImage("assets/icons/user6.png"),
                      ),
                      SizedBox(width: 8),
                      Text("MedSanctuary",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Icon(Icons.notifications_none),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "New Patient Case",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              const Text(
                "Complete the details below to initiate a consultation request for a remote specialist.",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              /// MAIN CARD
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text("PATIENT NAME",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(height: 5),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "e.g. MD Salman",
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.contact_page),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text("PRIORITY LEVEL",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        _chip("Low"),
                        _chip("Medium"),
                        _chip("High"),
                      ],
                    ),

                    const SizedBox(height: 15),

                    const Text("SYMPTOMS SUMMARY",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(height: 5),

                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const TextField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText:
                          "Describe the patient's current condition and medical history...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    const Text("CLINICAL ATTACHMENTS",
                        style: TextStyle(fontSize: 12, color: Colors.grey)),

                    const SizedBox(height: 10),

                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const UploadReportsScreen());
                          },
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.camera_alt),
                                SizedBox(height: 5),
                                Text("ADD PHOTO",
                                    style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        GestureDetector(
                          onTap: () {
                            Get.to(() => const VitalsInputScreen());
                          },
                          child: Container(
                            width: 90,
                            height: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: const DecorationImage(
                                image:
                                AssetImage("assets/images/sample.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// INFO BOX
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.green.shade100,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.info_outline),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Cases are automatically synced with the nearest hospital cluster. Ensure all details are accurate before submitting for remote diagnostic assistance.",
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),

              /// 🔥 ADDED SECTION (NO CHANGE ABOVE)

              const SizedBox(height: 20),

              const Text(
                "Recent Cases",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              GestureDetector(
                onTap: () {
                  Get.to(() => const CaseTrackingScreen());
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
                      const CircleAvatar(child: Icon(Icons.person)),
                      const SizedBox(width: 10),
                      const Expanded(child: Text("Amara Okafor")),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.green.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text("DIAGNOSED",
                            style: TextStyle(fontSize: 10)),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.arrow_forward_ios, size: 16)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chip(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text),
    );
  }
}