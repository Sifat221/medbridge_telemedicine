import 'package:get/get.dart';
import '../models/auth_result.dart';
import '../services/auth_service.dart';

class AuthController extends GetxController {

  var isLoading = false.obs;

  Future<AuthResult> login(String email, String pass) async {
    isLoading(true);
    try {
      final result = await AuthService.login(email, pass);
      if (!result.isSuccess) {
        return result;
      }
      Get.offAllNamed('/home');
      return result;
    } finally {
      isLoading(false);
    }
  }

  Future<AuthResult> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    isLoading(true);
    try {
      return await AuthService.signup(
        name: name,
        email: email,
        phone: phone,
        password: password,
      );
    } finally {
      isLoading(false);
    }
  }

  Future<void> logout() async {
    await AuthService.logout();
    Get.offAllNamed('/login');
    Get.snackbar("Success", "Logged out successfully");
  }
}