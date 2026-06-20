import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'appointment_success_screen.dart';

class PaymentProcessingScreen extends StatefulWidget {
  const PaymentProcessingScreen({super.key});

  @override
  State<PaymentProcessingScreen> createState() =>
      _PaymentProcessingScreenState();
}

class _PaymentProcessingScreenState
    extends State<PaymentProcessingScreen> {

  @override
  void initState() {
    super.initState();

    /// ⏳ Fake delay (simulate payment)
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() => const AppointmentSuccessScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF5F7FB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text("Processing Payment..."),
          ],
        ),
      ),
    );
  }
}