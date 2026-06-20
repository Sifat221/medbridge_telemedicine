import 'package:flutter/material.dart';

class PatientCaseDirectoryScreen extends StatelessWidget {
  const PatientCaseDirectoryScreen({super.key});

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
                "Patient Case Directory",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              const Text(
                "Manage and track medical submissions across your regional facility network.",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              /// SEARCH
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Search by patient name or ID...",
                    border: InputBorder.none,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              /// FILTER BUTTON
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(child: Text("Filters")),
              ),

              const SizedBox(height: 10),

              /// TABS
              Row(
                children: [
                  _tab("ALL CASES", true),
                  _tab("SUBMITTED", false),
                  _tab("UNDER REVIEW", false),
                ],
              ),

              const SizedBox(height: 10),

              /// LIST
              Expanded(
                child: ListView(
                  children: [
                    _case("Amara Okafor", "DIAGNOSED"),
                    _case("Liam Henderson", "UNDER REVIEW"),
                    _case("Elena Rodriguez", "SUBMITTED"),
                    _case("Chen Wei", "DIAGNOSED"),
                  ],
                ),
              ),

              /// BOTTOM CARD
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
                    Text("Need Specialist Input?",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 5),
                    Text(
                      "Escalate complex cases directly to our global network of specialized physicians for rapid diagnosis.",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    SizedBox(height: 10),
                    Text("Start Consultation",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _tab(String text, bool active) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: active ? const Color(0xff2D5BFF) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: active ? Colors.white : Colors.black, fontSize: 12),
      ),
    );
  }

  Widget _case(String name, String status) {
    return Container(
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
          Expanded(
            child: Text(name),
          ),
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(status,
                style: const TextStyle(fontSize: 10)),
          )
        ],
      ),
    );
  }
}