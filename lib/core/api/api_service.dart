import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'api_constants.dart';
import 'api_result.dart';

class ApiService {

  /// 🔐 GET TOKEN
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }

  static Future<ApiResult<dynamic>> get(String endpoint) async {
    final token = await getToken();
    return _sendRequest(
      method: "GET",
      endpoint: endpoint,
      token: token,
    );
  }

  static Future<ApiResult<dynamic>> post(String endpoint, Map body) async {
    final token = await getToken();
    return _sendRequest(
      method: "POST",
      endpoint: endpoint,
      token: token,
      body: body,
    );
  }

  static Future<ApiResult<dynamic>> _sendRequest({
    required String method,
    required String endpoint,
    required String? token,
    Map? body,
  }) async {
    final headers = {
      "Content-Type": "application/json",
      if (token != null && token.isNotEmpty) "Authorization": "Bearer $token",
    };

    ApiResult<dynamic>? lastNetworkFailure;
    final attemptedUrls = <String>[];

    for (final baseUrl in ApiConstants.fallbackBaseUrls) {
      attemptedUrls.add(baseUrl);
      try {
        late final http.Response response;
        if (method == "GET") {
          response = await http
              .get(Uri.parse(baseUrl + endpoint), headers: headers)
              .timeout(const Duration(seconds: 10));
        } else if (method == "POST") {
          response = await http
              .post(
                Uri.parse(baseUrl + endpoint),
                headers: headers,
                body: jsonEncode(body ?? {}),
              )
              .timeout(const Duration(seconds: 10));
        } else {
          return const ApiResult.failure(
            message: "Unsupported request method.",
            errorType: ApiErrorType.unknown,
          );
        }

        dynamic parsedData;
        if (response.body.isNotEmpty) {
          try {
            parsedData = jsonDecode(response.body);
          } catch (_) {
            return ApiResult.failure(
              message: "Response parsing failed.",
              errorType: ApiErrorType.parse,
              statusCode: response.statusCode,
            );
          }
        }

        if (response.statusCode >= 200 && response.statusCode < 300) {
          return ApiResult.success(
            data: parsedData,
            statusCode: response.statusCode,
          );
        }

        final serverMessage = parsedData is Map<String, dynamic>
            ? parsedData["message"] as String?
            : null;

        if (response.statusCode == 401 || response.statusCode == 403) {
          return ApiResult.failure(
            message: serverMessage ?? "Unauthorized request.",
            errorType: ApiErrorType.unauthorized,
            statusCode: response.statusCode,
          );
        }

        if (response.statusCode >= 500) {
          return ApiResult.failure(
            message: serverMessage ?? "Server error. Please try later.",
            errorType: ApiErrorType.server,
            statusCode: response.statusCode,
          );
        }

        return ApiResult.failure(
          message: serverMessage ?? "Request failed.",
          errorType: ApiErrorType.unknown,
          statusCode: response.statusCode,
        );
      } on SocketException {
        lastNetworkFailure = const ApiResult.failure(
          message: "No internet connection.",
          errorType: ApiErrorType.network,
        );
        continue;
      } on http.ClientException catch (e) {
        lastNetworkFailure = ApiResult.failure(
          message: "Backend fetch failed (${e.message}). Server down or CORS blocked.",
          errorType: ApiErrorType.network,
        );
        continue;
      } on TimeoutException {
        lastNetworkFailure = ApiResult.failure(
          message: "Request timeout while connecting backend.",
          errorType: ApiErrorType.timeout,
        );
        continue;
      } catch (e) {
        return ApiResult.failure(
          message: "Unexpected error: $e",
          errorType: ApiErrorType.unknown,
        );
      }
    }

    return ApiResult.failure(
      message:
          "${lastNetworkFailure?.message ?? 'Backend unreachable.'} Tried: ${attemptedUrls.join(', ')}",
      errorType: lastNetworkFailure?.errorType ?? ApiErrorType.network,
    );
  }
}