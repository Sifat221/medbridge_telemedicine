import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ✅ ADD THESE IMPORTS
import '../../files/camera_screen.dart';
import '../../files/gallery_screen.dart';
import '../../files/document_screen.dart';

class FileShareScreen extends StatelessWidget {
  const FileShareScreen({super.key});

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
                        backgroundImage:
                        AssetImage("assets/icons/user3.png"),
                      ),
                      SizedBox(width: 8),
                      Text("MedSanctuary",
                          style: TextStyle(
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const Icon(Icons.notifications_none),
                ],
              ),

              const SizedBox(height: 20),

              const Text("Select Files",
                  style:
                  TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

              const SizedBox(height: 5),

              const Text(
                "Choose how you want to share your medical records.",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              /// 🔥 OPTIONS (UPDATED ONLY)
              _option(Icons.camera_alt, "Camera", "SCAN REPORT"),
              _option(Icons.image, "Gallery", "UPLOAD PHOTOS"),
              _option(Icons.insert_drive_file, "Documents", "CLOUD / LOCAL"),

              const SizedBox(height: 20),

              /// SECURITY CARD
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff1E5BFF), Color(0xff4A7DFF)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("SECURE TRANSFER",
                        style: TextStyle(color: Colors.white70)),
                    SizedBox(height: 10),
                    Text(
                      "Your medical data is encrypted and private",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Reports shared with doctors expire automatically after 7 days.",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// RECENT
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Recent Shares",
                      style:
                      TextStyle(fontWeight: FontWeight.bold)),
                  Text("View All",
                      style: TextStyle(color: Colors.blue)),
                ],
              ),

              const SizedBox(height: 10),

              _file("Blood_Report_Aug_2023.pdf"),
              _file("XRay_Spine.jpg"),
              _file("Discharge_Summary.docx"),
              _file("Cardiac_Prescription.pdf"),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔥 UPDATED OPTION (ONLY ADD)
  Widget _option(IconData icon, String title, String sub) {
    return GestureDetector(
      onTap: () {
        if (title == "Camera") {
          Get.to(() => const CameraScreen());
        } else if (title == "Gallery") {
          Get.to(() => const GalleryScreen());
        } else if (title == "Documents") {
          Get.to(() => const DocumentScreen());
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: Icon(icon),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold)),
                Text(sub,
                    style: const TextStyle(color: Colors.grey)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _file(String name) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const Icon(Icons.insert_drive_file,
              color: Colors.red),
          const SizedBox(width: 10),
          Expanded(child: Text(name)),
          const Icon(Icons.more_vert)
        ],
      ),
    );
  }
}