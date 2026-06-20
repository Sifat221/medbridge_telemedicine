import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../models/auth_result.dart';
import '../../../shared/widgets/custom_button.dart';
import '../../../shared/widgets/custom_textfield.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _agreeTerms = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignup(AuthController controller) async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _phoneController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      Get.snackbar("Error", "সবগুলো ফিল্ড পূরণ করুন");
      return;
    }

    if (password != confirmPassword) {
      Get.snackbar("Error", "Password আর Confirm Password match করছে না");
      return;
    }

    if (!_agreeTerms) {
      Get.snackbar("Error", "Terms & Conditions এ agree করুন");
      return;
    }

    final result = await controller.signup(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );

    if (!result.isSuccess) {
      final color = result.errorType == AuthErrorType.invalidCredentials
          ? Colors.orange
          : Colors.red;
      Get.snackbar(
        "Signup Failed",
        result.message,
        backgroundColor: color,
        colorText: Colors.white,
      );
      return;
    }

    Get.snackbar(
      "Success",
      result.message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    Get.offAllNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.isRegistered<AuthController>()
        ? Get.find<AuthController>()
        : Get.put(AuthController());

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const Text(
                    "Create Account",
                    style: TextStyle(
                        fontSize: 28, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Enter your details to join the MedBridge community.",
                    style: TextStyle(color: Colors.grey),
                  ),

                  const SizedBox(height: 25),

                  const Text("Full Name"),
                  const SizedBox(height: 6),
                  CustomTextField(
                    hint: "John Doe",
                    icon: Icons.person,
                    controller: _nameController,
                  ),

                  const SizedBox(height: 15),

                  const Text("Email"),
                  const SizedBox(height: 6),
                  CustomTextField(
                    hint: "john@example.com",
                    icon: Icons.email,
                    controller: _emailController,
                  ),

                  const SizedBox(height: 15),

                  const Text("Phone Number"),
                  const SizedBox(height: 6),
                  CustomTextField(
                    hint: "+1(555) 000-0000",
                    icon: Icons.phone,
                    controller: _phoneController,
                  ),

                  const SizedBox(height: 15),

                  const Text("Password"),
                  const SizedBox(height: 6),
                  CustomTextField(
                    hint: "••••••••",
                    icon: Icons.lock,
                    isPassword: true,
                    controller: _passwordController,
                  ),

                  const SizedBox(height: 15),

                  const Text("Confirm Password"),
                  const SizedBox(height: 6),
                  CustomTextField(
                    hint: "••••••••",
                    icon: Icons.lock_outline,
                    isPassword: true,
                    controller: _confirmPasswordController,
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Checkbox(
                        value: _agreeTerms,
                        onChanged: (v) {
                          setState(() => _agreeTerms = v ?? false);
                        },
                      ),
                      const Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: "By signing up, I agree to the ",
                            children: [
                              TextSpan(
                                text: "Terms & Conditions",
                                style: TextStyle(color: Color(0xff2D5BFF)),
                              ),
                              TextSpan(text: " and "),
                              TextSpan(
                                text: "Privacy Policy.",
                                style: TextStyle(color: Color(0xff2D5BFF)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Obx(
                    () => CustomButton(
                      text: controller.isLoading.value ? "Signing Up..." : "Sign Up",
                      onTap: controller.isLoading.value
                          ? () {}
                          : () => _handleSignup(controller),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => LoginScreen());
                        },
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                            color: Color(0xff2D5BFF),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}