import 'package:flutter/material.dart';

class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({super.key});

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
                        AssetImage("assets/icons/user1.png"),
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

              /// TITLE + BUTTON
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Prescription",
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2D5BFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.download, size: 18),
                    label: const Text("Download PDF"),
                  )
                ],
              ),

              const SizedBox(height: 5),

              const Text(
                "Issued on Oct 24, 2023 • ID: #MS-88291",
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

                    /// DOCTOR INFO
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                              "assets/images/doctor6.png"),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: const [
                            Text("Dr. Sarah Mitchell",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold)),
                            Text("General Practitioner",
                                style:
                                TextStyle(color: Colors.grey)),
                          ],
                        )
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "St. Jude Medical Plaza, Suite 402\nsarah.mitchell@medsanctuary.com\n+1 (555) 902-0812",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 15),

                    /// PATIENT
                    const Text("PATIENT INFO",
                        style: TextStyle(fontWeight: FontWeight.bold)),

                    const SizedBox(height: 5),

                    const Text("Eleanor Vance"),
                    const Text("DOB: 12 July 1994 (29 Yrs)",
                        style: TextStyle(color: Colors.grey)),

                    const SizedBox(height: 15),

                    /// VITALS
                    Row(
                      children: [
                        _vitalBox("BP", "120/80"),
                        const SizedBox(width: 10),
                        _vitalBox("Weight", "64kg"),
                      ],
                    ),

                    const SizedBox(height: 20),

                    /// RX
                    const Center(
                      child: Text("Rx",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),

                    const SizedBox(height: 15),

                    /// MED 1
                    _medicineCard(
                      "Amoxicillin 500mg",
                      "Antibiotic Capsule",
                      "TWICE DAILY",
                      true,
                    ),

                    const SizedBox(height: 15),

                    /// MED 2
                    _medicineCard(
                      "Paracetamol 650mg",
                      "Fever & Pain Relief",
                      "AS NEEDED",
                      false,
                    ),

                    const SizedBox(height: 20),

                    /// INSTRUCTIONS
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text(
                        "Doctor's Instructions:\nIncrease fluid intake significantly. Avoid strenuous activity for the next 48 hours.",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// SIGNATURE
                    const Center(
                      child: Text(
                        "Sarah Mitchell",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2D5BFF)),
                      ),
                    ),

                    const Center(
                      child: Text(
                        "AUTHORIZED DIGITAL SIGNATURE",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// BUTTONS
                    Row(
                      children: [
                        Expanded(
                          child: _actionBtn("Find Pharmacy"),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _actionBtn("Request Refill"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _vitalBox(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(title, style: const TextStyle(color: Colors.grey)),
            Text(value,
                style:
                const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _medicineCard(
      String name, String desc, String tag, bool green) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: green
                    ? Colors.green.shade100
                    : Colors.blue.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(tag,
                  style: TextStyle(
                      fontSize: 10,
                      color: green ? Colors.green : Colors.blue)),
            )
          ],
        ),
        Text(desc, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 5),
        const Text("• After food"),
        const Text("• 7 Days duration"),
        const Text("• 14 Capsules total"),
      ],
    );
  }

  Widget _actionBtn(String text) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(child: Text(text)),
    );
  }
}