import 'dart:io';
import 'package:flutter/foundation.dart';

class ApiConstants {
  // Override with: --dart-define=API_BASE_URL=http://<host>:3000/api
  static const String _baseUrlFromEnv =
      String.fromEnvironment("API_BASE_URL", defaultValue: "");

  static String get baseUrl {
    if (_baseUrlFromEnv.isNotEmpty) return _baseUrlFromEnv;

    if (kIsWeb) return "http://localhost:3000/api";
    if (Platform.isAndroid) return "http://10.0.2.2:3000/api"; // Android emulator
    return "http://localhost:3000/api"; // Windows/iOS/macOS/Linux
  }

  static List<String> get fallbackBaseUrls {
    final values = <String>[
      baseUrl,
      "http://10.0.2.2:3000/api",
      "http://localhost:3000/api",
      "http://127.0.0.1:3000/api",
    ];

    return values.toSet().toList();
  }

  static const login = "/auth/login";
  static const signup = "/auth/signup";
  static const activities = "/activities";
}