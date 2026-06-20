import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  int selectedTime = 0;

  final List<String> times = [
    "10:00 AM",
    "11:00 AM",
    "12:00 PM",
    "2:00 PM",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Appointment")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Date
            const Text(
              "Select Date",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text("Today, 12 Aug"),

            const SizedBox(height: 20),

            /// Time
            const Text(
              "Available Time",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Wrap(
              spacing: 10,
              children: List.generate(
                times.length,
                    (index) => ChoiceChip(
                  label: Text(times[index]),
                  selected: selectedTime == index,
                  onSelected: (_) {
                    setState(() => selectedTime = index);
                  },
                ),
              ),
            ),

            const Spacer(),

            /// Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Confirm Booking"),
              ),
            )
          ],
        ),
      ),
    );
  }
}