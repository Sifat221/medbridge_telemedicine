import '../../../core/api/api_constants.dart';
import '../../../core/api/api_result.dart';
import '../../../core/api/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/auth_result.dart';

class AuthService {
  static Future<AuthResult> signup({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final apiResult = await ApiService.post(ApiConstants.signup, {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
      });

      if (!apiResult.isSuccess) {
        if (apiResult.errorType == ApiErrorType.network ||
            apiResult.errorType == ApiErrorType.timeout) {
          return AuthResult.failure(
            message: apiResult.message.isEmpty
                ? "Network issue. Please try again."
                : apiResult.message,
            errorType: AuthErrorType.network,
          );
        }

        if (apiResult.statusCode == 409) {
          return AuthResult.failure(
            message: apiResult.message.isEmpty
                ? "Account already exists with this email."
                : apiResult.message,
            errorType: AuthErrorType.invalidCredentials,
          );
        }

        if (apiResult.errorType == ApiErrorType.server) {
          return AuthResult.failure(
            message: apiResult.message.isEmpty
                ? "Server error. Please try again later."
                : apiResult.message,
            errorType: AuthErrorType.server,
          );
        }

        return AuthResult.failure(
          message: apiResult.message.isEmpty ? "Signup failed." : apiResult.message,
          errorType: AuthErrorType.unknown,
        );
      }

      return const AuthResult.success(
        message: "Account created successfully. Please log in.",
      );
    } catch (e) {
      return AuthResult.failure(
        message: "Unexpected signup error: $e",
        errorType: AuthErrorType.unknown,
      );
    }
  }

  static Future<AuthResult> login(String email, String password) async {
    try {
      final apiResult = await ApiService.post(ApiConstants.login, {
        "email": email,
        "password": password,
      });

      if (!apiResult.isSuccess) {
        if (apiResult.errorType == ApiErrorType.unauthorized) {
          return AuthResult.failure(
            message: apiResult.message.isEmpty
                ? "Invalid email or password."
                : apiResult.message,
            errorType: AuthErrorType.invalidCredentials,
          );
        }

        if (apiResult.errorType == ApiErrorType.network ||
            apiResult.errorType == ApiErrorType.timeout) {
          return AuthResult.failure(
            message: apiResult.message.isEmpty
                ? "Network issue. Please try again."
                : apiResult.message,
            errorType: AuthErrorType.network,
          );
        }

        if (apiResult.errorType == ApiErrorType.server) {
          return AuthResult.failure(
            message: apiResult.message.isEmpty
                ? "Server error. Please try again later."
                : apiResult.message,
            errorType: AuthErrorType.server,
          );
        }

        return AuthResult.failure(
          message: apiResult.message.isEmpty ? "Login failed." : apiResult.message,
          errorType: AuthErrorType.unknown,
        );
      }

      final data = apiResult.data;
      if (data is! Map<String, dynamic>) {
        return const AuthResult.failure(
          message: "Unexpected login response format.",
          errorType: AuthErrorType.server,
        );
      }

      final token = data["token"];
      if (token is String && token.isNotEmpty) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("token", token);
        return const AuthResult.success();
      }

      return const AuthResult.failure(
        message: "Login failed: token not received.",
        errorType: AuthErrorType.server,
      );
    } catch (e) {
      return AuthResult.failure(
        message: "Unexpected login error: $e",
        errorType: AuthErrorType.unknown,
      );
    }
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
  }
}