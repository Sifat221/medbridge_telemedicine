import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../appointment/screens/health_timeline_screen.dart';

class HealthRecordsScreen extends StatelessWidget {
  const HealthRecordsScreen({super.key});

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

              /// TITLE
              const Text(
                "Health Records",
                style: TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 5),

              const Text(
                "Your complete medical history, lab results, and vitals secured in one digital sanctuary.",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

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

                    /// TITLE ROW
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Vitals History",
                            style: TextStyle(
                                fontWeight: FontWeight.bold)),
                        Text("View Analytics",
                            style:
                            TextStyle(color: Colors.blue)),
                      ],
                    ),

                    const SizedBox(height: 10),

                    /// HEART RATE
                    _vitalCard("HEART RATE", "72 bpm", true),

                    const SizedBox(height: 15),

                    /// BP
                    _vitalCard("BLOOD PRESSURE", "118/76 mmHg", false),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// ALLERGIES
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text("Allergies",
                        style: TextStyle(
                            fontWeight: FontWeight.bold)),

                    const SizedBox(height: 10),

                    _allergy("Penicillin", Colors.red.shade100),
                    _allergy("Peanuts", Colors.grey.shade200),
                    _allergy("Latex", Colors.grey.shade200),

                    const SizedBox(height: 10),

                    GestureDetector(
                      onTap: () {
                        Get.to(() => const HealthTimelineScreen()); // ✅ ADD
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Center(
                          child: Text("HealthTimeline"),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// LAB REPORTS
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Lab Reports",
                            style: TextStyle(
                                fontWeight: FontWeight.bold)),
                        Text("Filter",
                            style:
                            TextStyle(color: Colors.blue)),
                      ],
                    ),

                    const SizedBox(height: 10),

                    _report("Complete Blood Count",
                        "Oct 24, 2023 • St. Mary's Lab"),
                    _report("Lipid Panel Profile",
                        "Sep 12, 2023 • General Medical"),
                    _report("Thyroid Function Test",
                        "Jul 05, 2023 • Diagnostics Plus"),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// VACCINATION
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const Text("Vaccinations",
                        style: TextStyle(
                            fontWeight: FontWeight.bold)),

                    const SizedBox(height: 10),

                    _vaccine("COVID-19 Booster",
                        "Dose 3 • Jan 12, 2024", Colors.blue),
                    _vaccine("Influenza (Annual)",
                        "Flu Quad • Oct 30, 2023", Colors.green),
                    _vaccine("Tetanus (Tdap)",
                        "Routine • May 15, 2019", Colors.grey),

                    const SizedBox(height: 15),

                    /// UPCOMING
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff1E5BFF),
                            Color(0xff3F7BFF),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(25), // 🔥 more rounded
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          )
                        ],
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            "UPCOMING",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              letterSpacing: 1,
                            ),
                          ),

                          SizedBox(height: 8),

                          Text(
                            "Next Flu Shot",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            "Schedule for Oct 2024",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
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

  Widget _vitalCard(String title, String value, bool heart) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(title,
              style: const TextStyle(
                  fontSize: 10, color: Colors.grey)),

          const SizedBox(height: 5),

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Text(value,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold)),
              Icon(
                heart ? Icons.favorite : Icons.monitor_heart,
                color: heart ? Colors.green : Colors.blue,
              )
            ],
          ),

          const SizedBox(height: 10),

          /// 🔥 GRAPH ADD
          SizedBox(
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(8, (index) {
                final heights = [10, 18, 14, 22, 16, 28, 12, 20];

                return Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    height: heights[index].toDouble(),
                    decoration: BoxDecoration(
                      color: index == 5
                          ? (heart ? Colors.green : Colors.blue)
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _allergy(String text, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text),
    );
  }

  Widget _report(String title, String sub) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.description,
              color: Color(0xff2D5BFF)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(sub,
                    style:
                    const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const Icon(Icons.download, size: 18)
        ],
      ),
    );
  }

  Widget _vaccine(String title, String sub, Color color) {
    return Row(
      children: [
        Icon(Icons.circle, size: 10, color: color),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(sub,
                style:
                const TextStyle(color: Colors.grey)),
          ],
        )
      ],
    );
  }
}