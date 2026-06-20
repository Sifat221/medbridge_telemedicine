import 'package:flutter/material.dart';

class CaseRequestsScreen extends StatefulWidget {
  const CaseRequestsScreen({super.key});

  @override
  State<CaseRequestsScreen> createState() => _CaseRequestsScreenState();
}

class _CaseRequestsScreenState extends State<CaseRequestsScreen> {

  int accepted = 8;

  List<Map<String, dynamic>> cases = [
    {
      "name": "Sarah Jenkins",
      "info": "28 years • Female",
      "symptoms": "Persistent chest pressure, shortness of breath for 2 hours.",
      "urgent": true,
      "tag": null,
    },
    {
      "name": "Robert Chen",
      "info": "64 years • Male",
      "symptoms": "Routine diabetes follow-up. Glucose levels trending high.",
      "urgent": false,
      "tag": "CONSULTATION",
    },
    {
      "name": "Emma Wilson",
      "info": "08 years • Female",
      "symptoms": "Mild skin rash on arms, possible allergic reaction.",
      "urgent": false,
      "tag": "PEDIATRICS",
    },
  ];

  @override
  Widget build(BuildContext context) {
    int pending = cases.length;

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
                children: const [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                        AssetImage("assets/icons/user9.png"),
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

              const Text("Case Requests",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),

              const Text("Review and prioritize patient intakes",
                  style: TextStyle(color: Colors.grey)),

              const SizedBox(height: 15),

              /// STATS
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xff2D5BFF),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.assignment, color: Colors.white),
                          const SizedBox(height: 5),
                          Text("$pending",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          const Text("PENDING",
                              style: TextStyle(color: Colors.white70)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.check_circle, color: Colors.green),
                          const SizedBox(height: 5),
                          Text("$accepted",
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold)),
                          const Text("ACCEPTED TODAY",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// LIST
              ...cases.asMap().entries.map((entry) {
                int index = entry.key;
                var item = entry.value;

                return _caseCard(item, index);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _caseCard(Map item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: item["urgent"]
            ? const Border(left: BorderSide(color: Colors.red, width: 3))
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TOP ROW
          Row(
            children: [
              const CircleAvatar(
                backgroundImage:
                AssetImage("assets/images/doctor12.png"),
              ),
              const SizedBox(width: 10),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item["name"],
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(item["info"],
                        style: const TextStyle(
                            color: Colors.grey, fontSize: 12)),
                  ],
                ),
              ),

              const Text("4m ago",
                  style: TextStyle(fontSize: 10, color: Colors.grey))
            ],
          ),

          const SizedBox(height: 10),

          /// TAG
          if (item["urgent"])
            _tag("HIGH URGENCY", Colors.red)
          else if (item["tag"] != null)
            _tag(item["tag"], Colors.green),

          const SizedBox(height: 10),

          /// SYMPTOMS BOX
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(item["symptoms"],
                style: const TextStyle(fontSize: 12)),
          ),

          const SizedBox(height: 10),

          /// BUTTONS
          Row(
            children: [

              /// REJECT
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      cases.removeAt(index);
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Case Rejected")),
                    );
                  },
                  icon: const Icon(Icons.close, size: 16, color: Colors.red),
                  label: const Text("Reject",
                      style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
              ),

              const SizedBox(width: 10),

              /// ACCEPT
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      cases.removeAt(index);
                      accepted++;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Case Accepted")),
                    );
                  },
                  icon: const Icon(Icons.check, size: 16),
                  label: const Text("Accept"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2D5BFF),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  /// TAG WIDGET
  Widget _tag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text,
          style: TextStyle(fontSize: 10, color: color)),
    );
  }
}


