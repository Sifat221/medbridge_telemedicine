import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_screen.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final List<TextEditingController> controllers =
  List.generate(4, (_) => TextEditingController());

  final List<FocusNode> focusNodes =
  List.generate(4, (_) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              /// 🔝 TOP BAR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.shield, color: Color(0xff2D5BFF)),
                      SizedBox(width: 6),
                      Text(
                        "MedBridge",
                        style: TextStyle(
                          color: Color(0xff2D5BFF),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.close),
                  )
                ],
              ),

              const SizedBox(height: 30),

              /// 🔐 IMAGE
              Stack(
                alignment: Alignment.center,
                children: [

                  Positioned(
                    top: 10,
                    child: Container(
                      width: 220,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 0,
                    child: Container(
                      width: 240,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                  Container(
                    width: 220,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/verify.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    right: 40,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                          )
                        ],
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Color(0xff2D5BFF),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              /// TITLE
              const Text(
                "Verify Your Identity",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "We've sent a 4-digit security code to your registered mobile number",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 6),

              const Text(
                "+1 •••••• 4290",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),

              const SizedBox(height: 25),

              /// 🔢 OTP INPUT
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  4,
                      (index) => SizedBox(
                    width: 60,
                    height: 60,
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: "",
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {

                        /// NEXT FIELD
                        if (value.isNotEmpty && index < 3) {
                          focusNodes[index + 1].requestFocus();
                        }

                        /// BACKSPACE SUPPORT
                        if (value.isEmpty && index > 0) {
                          focusNodes[index - 1].requestFocus();
                        }
                      },
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// ✅ VERIFY BUTTON
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
                    String otp = controllers.map((e) => e.text).join();

                    if (otp.length < 4) {
                      Get.snackbar(
                        "Error",
                        "Enter complete 4-digit code",
                        backgroundColor: Colors.red,
                        colorText: Colors.white,
                      );
                    } else {
                      Get.snackbar(
                        "Success",
                        "Verification Successful",
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );

                      Future.delayed(
                        const Duration(milliseconds: 500),
                            () {
                              Get.offAllNamed('/home');
                        },
                      );
                    }
                  },
                  child: const Text("Verify"),
                ),
              ),

              const SizedBox(height: 15),

              /// RESEND
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't receive the code? "),
                  GestureDetector(
                    onTap: () {
                      Get.snackbar("Resent", "Code sent again");
                    },
                    child: const Text(
                      "Resend Code",
                      style: TextStyle(
                        color: Color(0xff2D5BFF),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              /// FOOTER
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock, size: 16),
                      SizedBox(width: 5),
                      Text("END-TO-END ENCRYPTED",
                          style: TextStyle(fontSize: 10)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.verified, size: 16),
                      SizedBox(width: 5),
                      Text("HIPAA COMPLIANT",
                          style: TextStyle(fontSize: 10)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}