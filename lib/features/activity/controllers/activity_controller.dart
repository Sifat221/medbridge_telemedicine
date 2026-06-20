import 'package:get/get.dart';
import '../services/activity_service.dart';

class ActivityController extends GetxController {
  var isLoading = true.obs;
  var list = [].obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetch();
    super.onInit();
  }

  void fetch() async {
    try {
      isLoading(true);
      errorMessage('');
      final result = await ActivityService.getActivities();
      if (result.isSuccess && result.data is List) {
        list.assignAll(result.data as List);
      } else {
        list.clear();
        errorMessage(result.message);
      }
    } finally {
      isLoading(false);
    }
  }
}