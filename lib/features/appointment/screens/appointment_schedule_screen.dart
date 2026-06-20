import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../appointment/screens/cancellation_policy_screen.dart';
import '../../appointment/screens/booking_success_screen.dart';

class AppointmentScheduleScreen extends StatefulWidget {
  const AppointmentScheduleScreen({super.key});

  @override
  State<AppointmentScheduleScreen> createState() =>
      _AppointmentScheduleScreenState();
}

class _AppointmentScheduleScreenState
    extends State<AppointmentScheduleScreen> {

  int selectedDateIndex = 2;
  int selectedSlotIndex = 1;

  final List<Map<String, dynamic>> dates = [
    {"day": "MON", "date": "09"},
    {"day": "TUE", "date": "10"},
    {"day": "WED", "date": "11"},
    {"day": "THU", "date": "12"},
    {"day": "FRI", "date": "13"},
  ];

  final List<Map<String, dynamic>> slots = [
    {"time": "09:00 AM", "booked": true},
    {"time": "10:00 AM", "booked": false},
    {"time": "11:30 AM", "booked": false},
    {"time": "01:00 PM", "booked": false},
    {"time": "02:30 PM", "booked": true},
    {"time": "04:00 PM", "booked": false},
  ];

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
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        radius: 18,
                        backgroundImage:
                        AssetImage("assets/icons/user10.png"), // ✅ profile pic
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

              /// MONTH
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("September 2024",
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Icon(Icons.chevron_left),
                      Icon(Icons.chevron_right),
                    ],
                  )
                ],
              ),

              const SizedBox(height: 15),

              /// DATE SELECT
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(dates.length, (index) {
                  bool isSelected = selectedDateIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDateIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xff2D5BFF)
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Text(dates[index]["day"],
                              style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.grey,
                                  fontSize: 10)),
                          Text(dates[index]["date"],
                              style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),

              const Text("Available Slots",
                  style: TextStyle(fontWeight: FontWeight.bold)),

              const SizedBox(height: 10),

              /// SLOT LIST
              Expanded(
                child: ListView.builder(
                  itemCount: slots.length,
                  itemBuilder: (context, index) {
                    final slot = slots[index];
                    bool isSelected = selectedSlotIndex == index;
                    bool isBooked = slot["booked"];

                    return GestureDetector(
                      onTap: () {
                        if (!isBooked) {
                          setState(() {
                            selectedSlotIndex = index;
                          });
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.blue.shade50
                              : Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: isSelected
                              ? Border.all(color: const Color(0xff2D5BFF))
                              : null,
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.access_time,
                                color: isSelected
                                    ? Colors.blue
                                    : Colors.grey),

                            const SizedBox(width: 10),

                            Expanded(
                              child: Text(
                                slot["time"],
                                style: TextStyle(
                                  color: isBooked
                                      ? Colors.grey
                                      : Colors.black,
                                ),
                              ),
                            ),

                            if (isBooked)
                              const Text("BOOKED",
                                  style: TextStyle(color: Colors.grey))
                            else if (isSelected)
                              const Text("SELECTED",
                                  style: TextStyle(color: Colors.blue))
                            else
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedSlotIndex = index;
                                  });
                                },
                                child: const Icon(Icons.add),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              /// BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedSlotIndex != -1) {
                      Get.to(() => const BookingSuccessScreen());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2D5BFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text("Confirm Booking →"),
                ),
              ),

              const SizedBox(height: 5),

              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CancellationPolicyScreen(),
                      ),
                    );
                  },
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                      children: [
                        TextSpan(text: "By booking you agree to our "),
                        TextSpan(
                          text: "Cancellation Policy",
                          style: TextStyle(
                            color: Color(0xff2D5BFF), // 🔥 BLUE
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(text: "."),
                      ],
                    ),
                  ),
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
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}