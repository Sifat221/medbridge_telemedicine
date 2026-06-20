import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medbridge_telemedicine/features/appointment/screens/payment_processing_screen.dart';

class BookingSummaryScreen extends StatefulWidget {
  const BookingSummaryScreen({super.key});

  @override
  State<BookingSummaryScreen> createState() => _BookingSummaryScreenState();
}

class _BookingSummaryScreenState extends State<BookingSummaryScreen> {

  String gender = "Male";
  int selectedPayment = 0; // 0=Insurance,1=Card,2=Cash

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: const Text("Booking Summary",
            style: TextStyle(color: Colors.black)),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 👨‍⚕️ DOCTOR CARD
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundImage:
                    AssetImage("assets/images/doctor4.png"),
                  ),
                  const SizedBox(width: 12),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text("Dr. James Wilson",
                              style:
                              TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Text("VERIFIED",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.green)),
                          ),
                        ],
                      ),

                      const SizedBox(height: 4),

                      const Text(
                        "Senior Cardiologist • St. Mary's Hospital",
                        style: TextStyle(color: Colors.grey),
                      ),

                      const SizedBox(height: 8),

                      /// 🔥 DATE TIME BLUE
                      Row(
                        children: const [
                          Icon(Icons.calendar_today,
                              size: 14, color: Color(0xff2D5BFF)),
                          SizedBox(width: 5),
                          Text("Oct 24, 2023",
                              style: TextStyle(
                                  color: Color(0xff2D5BFF))),
                          SizedBox(width: 10),
                          Icon(Icons.access_time,
                              size: 14, color: Color(0xff2D5BFF)),
                          SizedBox(width: 5),
                          Text("09:30 AM",
                              style: TextStyle(
                                  color: Color(0xff2D5BFF))),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// 🧾 PATIENT INFO
            const Text("Patient Information",
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold)),

            const SizedBox(height: 10),

            _input("Full Name", "e.g. John Doe"),
            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(child: _input("Age", "28")),
                const SizedBox(width: 10),
                Expanded(child: _dropdown()),
              ],
            ),

            const SizedBox(height: 10),

            _input("Reason for Visit",
                "Describe your symptoms..."),

            const SizedBox(height: 20),

            /// 💳 PAYMENT
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Payment Method",
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text("Fees: \$120.00",
                    style: TextStyle(color: Color(0xff2D5BFF))),
              ],
            ),

            const SizedBox(height: 10),

            _payment("Insurance", Icons.security, 0),
            _payment("Credit Card", Icons.credit_card, 1),
            _payment("Cash", Icons.money, 2),

            const SizedBox(height: 20),

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
                  Get.to(() => const PaymentProcessingScreen());
                },
                child: const Text("Confirm & Pay →"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// INPUT
  Widget _input(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }

  /// 🔥 DROPDOWN FIXED
  Widget _dropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Gender",
            style:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: gender,
              items: const [
                DropdownMenuItem(value: "Male", child: Text("Male")),
                DropdownMenuItem(value: "Female", child: Text("Female")),
              ],
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  /// 🔥 PAYMENT SELECTABLE
  Widget _payment(String title, IconData icon, int index) {
    final isSelected = selectedPayment == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPayment = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: isSelected
              ? Border.all(color: const Color(0xff2D5BFF), width: 2)
              : null,
        ),
        child: Row(
          children: [
            Icon(icon,
                color: isSelected
                    ? const Color(0xff2D5BFF)
                    : Colors.grey),
            const SizedBox(width: 10),
            Text(title,
                style: TextStyle(
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.normal)),
          ],
        ),
      ),
    );
  }
}