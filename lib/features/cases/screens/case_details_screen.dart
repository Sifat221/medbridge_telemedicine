import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../reports/screens/upload_reports_screen.dart'; // ✅ ADD
import '../../dashboard/screens/doctor_dashboard_screen.dart';
import '../../appointment/screens/appointment_schedule_screen.dart';

class CaseDetailsScreen extends StatelessWidget {
  const CaseDetailsScreen({super.key});

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
                      Icon(Icons.arrow_back),
                      SizedBox(width: 8),
                      Text("MedSanctuary",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.notifications_none),
                      SizedBox(width: 10),
                      CircleAvatar(radius: 14),
                    ],
                  )

                ],
              ),

              const SizedBox(height: 20),


              /// PROFILE CARD
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// IMAGE
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/doctor11.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        /// INFO
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 3),
                                decoration: BoxDecoration(
                                  color: const Color(0xff2D5BFF),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text("96 1 96",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10)),
                              ),

                              const SizedBox(height: 5),

                              const Text("Elena Richardson",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),

                              const Text(
                                  "Female • 34 Years • ID: P-59210",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                        ),

                        /// STATUS
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.green.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text("ACTIVE CASE",
                              style: TextStyle(fontSize: 10)),
                        )
                      ],
                    ),

                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("BLOOD GROUP\nA Positive (A+)"),
                        Text("REFERRAL\nDr. James Wilson"),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("ADMISSION\nOct 24, 2023"),
                        Text("PRIORITY\nHigh",
                            style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              /// VITALS
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Current Vitals",
                            style:
                            TextStyle(fontWeight: FontWeight.bold)),
                        Text("Last updated: 10 mins ago",
                            style: TextStyle(
                                fontSize: 10, color: Colors.grey)),
                      ],
                    ),

                    const SizedBox(height: 10),

                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics:
                      const NeverScrollableScrollPhysics(),
                      childAspectRatio: 2.5,
                      children: const [
                        _vital("118/75", "BP (mmHg)", "Normal"),
                        _vital("72", "Pulse", "Stable"),
                        _vital("99.8", "Temp (F)", "Elevated"),
                        _vital("98%", "SpO2", "Optimal"),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              /// SYMPTOMS
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text("Reported Symptoms",
                        style: TextStyle(fontWeight: FontWeight.bold)),

                    const SizedBox(height: 10),

                    Wrap(
                      spacing: 8,
                      children: [
                        _chip("Persistent Migraine"),
                        _chip("Light Sensitivity"),
                        _chip("Fatigue"),
                        _chip("Nausea"),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Patient reports symptoms started 48 hours ago after prolonged screen exposure. Pain localized in the frontal lobe area.",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              /// FILES
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Medical Reports & Scans",
                            style:
                            TextStyle(fontWeight: FontWeight.bold)),
                        Text("View All Files",
                            style: TextStyle(color: Colors.blue)),
                      ],
                    ),

                    const SizedBox(height: 10),

                    _file("Initial_Blood_Work.pdf"),
                    _file("Brain_MRI_Scan_Lateral.jpg"),
                    _file("Neurology_History_Referral.pdf"),

                    const SizedBox(height: 10),

                    InkWell(
                      onTap: () {
                        Get.to(() => const UploadReportsScreen());
                      },
                      child: const Center(
                        child: Text("+ ATTACH REPORT"),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// BUTTONS
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const DoctorDashboardScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2D5BFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Start Consultation"),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const AppointmentScheduleScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Appointment Schedule"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// VITAL CARD
class _vital extends StatelessWidget {
  final String value;
  final String label;
  final String status;
  const _vital(this.value, this.label, this.status);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xffF5F7FB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(status,
              style: const TextStyle(fontSize: 10, color: Colors.green)),
          Text(value,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}

/// CHIP
Widget _chip(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: Colors.grey.shade200,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(text, style: const TextStyle(fontSize: 12)),
  );
}

/// FILE ITEM
Widget _file(String name) {
  return ListTile(
    contentPadding: EdgeInsets.zero,
    leading: const Icon(Icons.insert_drive_file, color: Colors.red),
    title: Text(name),
    trailing: const Icon(Icons.download),
  );
}