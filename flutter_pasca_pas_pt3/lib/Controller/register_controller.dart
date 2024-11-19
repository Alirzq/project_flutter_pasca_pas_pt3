import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../API/API_service.dart';


class RegisterController extends GetxController {
  var isLoading = false.obs;
  final ApiService _apiService = ApiService();
  final storage = GetStorage();

  Future<void> registerUser(String username, String password, String fullName, String email) async {
    isLoading.value = true;
    try {
      final result = await _apiService.registerUser(username, password, fullName, email);
      isLoading.value = false;

      // Assuming the API returns a token upon successful registration
      if (result['token'] != null) {
        String token = result['token'];
        storage.write('authToken', token);
        Get.snackbar('Success', 'Registration successful: Token saved');
        // Navigate to login or another page if needed
        Get.toNamed('/login');
      } else {
        Get.snackbar('Success', 'Registration successful. Please log in.');
        // Navigate to login or another page
        Get.toNamed('/login');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Registration failed: $e');
    }
  }
}
