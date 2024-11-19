import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../API/API_service.dart';
import '../Pages/home_page.dart';


class LoginController extends GetxController {
  var isLoading = false.obs;
  final ApiService _apiService = ApiService();
  final storage = GetStorage();

  Future<void> loginUser(String username, String password) async {
    isLoading.value = true;
    try {
      final result = await _apiService.loginUser(username, password);
      isLoading.value = false;

      if (result['token'] != null) {
        String token = result['token'];
        storage.write('authToken', token);
        Get.snackbar('Success', 'Login successful');
        // Navigate to home or another page
        Get.to(MainPage());
      } else {
        Get.snackbar('Error', result['message'] ?? 'Login failed');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Login failed: $e');
    }
  }
}
