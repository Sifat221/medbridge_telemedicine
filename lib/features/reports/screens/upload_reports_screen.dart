import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../cases/screens/patient_case_directory_screen.dart';
import 'package:get/get.dart';

class UploadReportsScreen extends StatelessWidget {
  const UploadReportsScreen({super.key});

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
                children: const [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 10),
                  Text("MedSanctuary",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),

              const SizedBox(height: 20),

              const Text(
                "Upload Reports",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              const Text(
                "Securely store and share your medical documentation with your care team.",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              /// SNAP CARD
              GestureDetector(
                onTap: () async {
                  final picker = ImagePicker();

                  final XFile? image =
                  await picker.pickImage(source: ImageSource.camera);

                  if (image != null) {
                    print("Image path: ${image.path}");
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xff2D5BFF), Color(0xff1E3FA8)],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white24,
                        child: Icon(Icons.camera_alt, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Text("Snap a Photo",
                          style: TextStyle(color: Colors.white)),
                      Text("Instant scan your document",
                          style: TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),

              /// UPLOAD FILE
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.insert_drive_file, color: Colors.blue),
                    SizedBox(width: 10),
                    Text("Upload File\nPDF, JPG, or PNG up to 10MB"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// RECENT
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent Documents"),
                  Text("3 FILES", style: TextStyle(color: Colors.blue)),
                ],
              ),

              const SizedBox(height: 10),

              _doc("Blood_Report.pdf"),
              _doc("X-Ray.jpg"),
              _doc("Prescription.png"),

              const Spacer(),

              /// BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => const PatientCaseDirectoryScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2D5BFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Create Patient Case →"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _doc(String name) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.picture_as_pdf, color: Colors.red),
          const SizedBox(width: 10),
          Expanded(child: Text(name)),
          const Icon(Icons.delete_outline)
        ],
      ),
    );
  }
}