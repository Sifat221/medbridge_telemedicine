import 'package:flutter/material.dart';
import 'package:get/get.dart';

// 👉 NEXT SCREEN
import 'patient_info_screen.dart';
import 'new_patient_case_screen.dart';

class SymptomsScreen extends StatefulWidget {
  const SymptomsScreen({super.key});

  @override
  State<SymptomsScreen> createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {

  List<String> selected = [];

  Widget _symptomCard(String title, IconData icon, Color color) {
    bool isSelected = selected.contains(title);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selected.remove(title);
          } else {
            selected.add(title);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 10),
            Text(title),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      body: SafeArea(
        child: SingleChildScrollView( // ✅ FIXED
          child: Padding(
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
                          AssetImage("assets/icons/user5.png"),
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
                  "STEP 2 OF 4",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 5),

                const Text(
                  "What are your symptoms?",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 5),

                const Text(
                  "Please select all that apply. This helps our doctors prepare for your consultation.",
                  style: TextStyle(color: Colors.grey),
                ),

                const SizedBox(height: 20),

                /// GRID
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _symptomCard("Fever", Icons.thermostat, Colors.red),
                    _symptomCard("Cough", Icons.monitor_heart, Colors.green),
                    _symptomCard("Headache", Icons.psychology, Colors.blue),
                    _symptomCard("Fatigue", Icons.bed, Colors.grey),
                  ],
                ),

                const SizedBox(height: 10),

                /// NAUSEA
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Nausea or Dizziness"),
                      Icon(Icons.circle_outlined, size: 18),
                    ],
                  ),
                ),

                const SizedBox(height: 15),

                const Text("Other symptoms or notes"),

                const SizedBox(height: 5),

                /// TEXT FIELD
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText:
                      "Describe any other symptoms or details about when they started...",
                      border: InputBorder.none,
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                /// INFO BOX
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.info, color: Colors.blue),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Medical Note: If you are experiencing chest pain or severe difficulty breathing, please seek emergency care immediately.",
                          style: TextStyle(fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 20), // ✅ Spacer replaced

                /// CONTINUE BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const NewPatientCaseScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2D5BFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("Continue →"),
                  ),
                ),

                const SizedBox(height: 10),

                const Center(
                  child: Text(
                    "Your data is encrypted and HIPAA compliant.",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}