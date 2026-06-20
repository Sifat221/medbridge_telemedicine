import '../../../core/api/api_service.dart';
import '../../../core/api/api_result.dart';
import '../../../core/api/api_constants.dart';

class ActivityService {
  static Future<ApiResult<dynamic>> getActivities() async {
    return ApiService.get(ApiConstants.activities);
  }
}