import 'package:flutter/material.dart';
import '../../diagnosis/screens/diagnosis_plan_screen.dart';

class PrescriptionWritingScreen extends StatefulWidget {
  const PrescriptionWritingScreen({super.key});

  @override
  State<PrescriptionWritingScreen> createState() =>
      _PrescriptionWritingScreenState();
}

class _PrescriptionWritingScreenState
    extends State<PrescriptionWritingScreen> {

  String selectedFrequency = "Twice daily (BID)";
  bool isDays = true;

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
                        AssetImage("assets/icons/user11.png"),
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

              /// TITLE + BADGE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "New\nPrescription",
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.green.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text("ACTIVE CONSULTATION",
                        style: TextStyle(
                            fontSize: 10, color: Colors.green)),
                  )
                ],
              ),

              const SizedBox(height: 5),

              const Text(
                "Patient: Sarah Jenkins (ID: #882-01)",
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

                    /// MED NAME
                    const Text("Medication Name"),
                    const SizedBox(height: 8),

                    TextField(
                      decoration: InputDecoration(
                        hintText:
                        "Start typing medication (e.g. Amoxicillin)",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        suffixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    /// CHIPS
                    Wrap(
                      spacing: 8,
                      children: const [
                        Chip(label: Text("Amoxicillin 500mg")),
                        Chip(label: Text("Azithromycin 250mg")),
                      ],
                    ),

                    const SizedBox(height: 15),

                    /// DOSAGE
                    const Text("Dosage"),
                    const SizedBox(height: 8),

                    TextField(
                      decoration: InputDecoration(
                        hintText: "e.g. 500mg",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text("VERIFY WITH PATIENT HISTORY",
                        style: TextStyle(fontSize: 10, color: Colors.grey)),

                    const SizedBox(height: 15),

                    /// FREQUENCY
                    const Text("Frequency"),
                    const SizedBox(height: 8),

                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: DropdownButton<String>(
                        value: selectedFrequency,
                        isExpanded: true,
                        underline: const SizedBox(),
                        items: [
                          "Once daily",
                          "Twice daily (BID)",
                          "Three times daily"
                        ]
                            .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                            .toList(),
                        onChanged: (val) {
                          setState(() {
                            selectedFrequency = val!;
                          });
                        },
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// DURATION
                    const Text("Duration"),
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        _toggleBtn("Days", isDays, () {
                          setState(() => isDays = true);
                        }),
                        const SizedBox(width: 8),
                        _toggleBtn("Weeks", !isDays, () {
                          setState(() => isDays = false);
                        }),
                      ],
                    ),

                    const SizedBox(height: 10),

                    TextField(
                      decoration: InputDecoration(
                        hintText: "7",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// NOTES
                    const Text("Additional Notes"),
                    const SizedBox(height: 8),

                    TextField(
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText:
                        "Take after food. Avoid dairy for 2 hours post-dosage.",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    /// PHARMACY
                    Row(
                      children: [
                        const Icon(Icons.local_pharmacy,
                            color: Colors.blue),
                        const SizedBox(width: 10),
                        const Expanded(
                          child: Text(
                              "Preferred: CVS Pharmacy #402\n1221 Medical Center Dr."),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("CHANGE"),
                        )
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const DiagnosisPlanScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2D5BFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Preview Prescription"),
                ),
              ),
            ],
          ),
        ),
      ),

      /// BOTTOM NAV
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: const Color(0xff2D5BFF),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Doctors"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Consultation"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  Widget _toggleBtn(String text, bool active, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
        const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: active ? const Color(0xff2D5BFF) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: active ? Colors.white : Colors.black,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}