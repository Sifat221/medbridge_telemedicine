import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'booking_summary_screen.dart';

class AvailabilityScreen extends StatefulWidget {
  const AvailabilityScreen({super.key});

  @override
  State<AvailabilityScreen> createState() => _AvailabilityScreenState();
}

class _AvailabilityScreenState extends State<AvailabilityScreen> {

  int selectedDate = 1;

  int selectedMorning = -1;
  int selectedAfternoon = -1;
  int selectedEvening = -1;

  final List<String> dates = ["MON\n12", "TUE\n13", "WED\n14", "THU\n15"];

  final List<String> morning = [
    "09:00 AM","09:30 AM","10:00 AM","10:30 AM","11:00 AM","11:30 AM"
  ];

  final List<String> afternoon = [
    "01:00 PM","01:30 PM","02:00 PM"
  ];

  final List<String> evening = [
    "05:00 PM","05:30 PM","06:00 PM"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// 🔝 TOP BAR
              Row(
                children: [
                  const Icon(Icons.arrow_back),
                  const SizedBox(width: 10),
                  const Text(
                    "MedBridge",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2D5BFF)),
                  ),
                  const Spacer(),
                  const CircleAvatar(
                    radius: 16,
                    backgroundImage:
                    AssetImage("assets/icons/doctor.png"),
                  ),
                  const SizedBox(width: 10),
                  const Icon(Icons.notifications_none),
                ],
              ),

              const SizedBox(height: 20),

              /// 👨‍⚕️ DOCTOR CARD
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundImage:
                      AssetImage("assets/images/doctor3.png"),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text("AVAILABLE",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10)),
                        ),
                        const SizedBox(height: 5),
                        const Text("Dr. Sarah Jenkins",
                            style:
                            TextStyle(fontWeight: FontWeight.bold)),
                        const Text(
                            "Cardiology Specialist • 12 years exp.",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// 📅 DATE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Select Date",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("October 2023",
                      style: TextStyle(color: Color(0xff2D5BFF))),
                ],
              ),

              const SizedBox(height: 15),

              Row(
                children: List.generate(dates.length, (index) {
                  final isSelected = selectedDate == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDate = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xff2D5BFF)
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        dates[index],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                          isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              /// ⏰ MORNING
              _title("Morning Slots"),
              _slotGrid(morning, "morning"),

              /// ⏰ AFTERNOON
              _title("Afternoon Slots"),
              _slotGrid(afternoon, "afternoon"),

              /// ⏰ EVENING
              _title("Evening Slots"),
              _slotGrid(evening, "evening"),

              const Spacer(),

              /// 🧾 INFO
              /// 🧾 INFO (🔥 FIXED EXACT UI)
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white, // 🔥 white background
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    /// LEFT
                    const Text(
                      "SELECTED SLOT\nTue, 13 Oct • 10:30 AM",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),

                    /// RIGHT
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "CONSULTATION FEE",
                          style: TextStyle(
                            color: Colors.grey, // 🔥 label grey
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "\$95.00",
                          style: TextStyle(
                            color: Color(0xff2D5BFF), // 🔥 only amount blue
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              /// 🔵 BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2D5BFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    Get.to(() => const BookingSummaryScreen());
                  },
                  child: const Text("Continue to Booking"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// 🔘 TITLE WITH ICON
  Widget _title(String text) {
    IconData icon;

    if (text.contains("Morning")) {
      icon = Icons.wb_sunny_outlined;
    } else if (text.contains("Afternoon")) {
      icon = Icons.light_mode_outlined;
    } else {
      icon = Icons.nightlight_round;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.grey),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  /// SLOT GRID
  Widget _slotGrid(List<String> list, String type) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(list.length, (index) {

        bool isSelected = false;

        if (type == "morning") {
          isSelected = selectedMorning == index;
        } else if (type == "afternoon") {
          isSelected = selectedAfternoon == index;
        } else {
          isSelected = selectedEvening == index;
        }

        return GestureDetector(
          onTap: () {
            setState(() {

              if (type == "morning") {
                selectedMorning = index;
                selectedAfternoon = -1;
                selectedEvening = -1;
              } else if (type == "afternoon") {
                selectedAfternoon = index;
                selectedMorning = -1;
                selectedEvening = -1;
              } else {
                selectedEvening = index;
                selectedMorning = -1;
                selectedAfternoon = -1;
              }

            });
          },
          child: Container(
            padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xff2D5BFF)
                  : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              list[index],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      }),
    );
  }
}