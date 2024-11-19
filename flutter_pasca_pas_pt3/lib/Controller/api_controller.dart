import 'package:get/get.dart';
import '../API/ApiService.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var products = <dynamic>[].obs;
  final FakeStoreService _fakeStoreService = FakeStoreService();

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var fetchedProducts = await _fakeStoreService.fetchProducts();
      products.value = fetchedProducts;
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products: $e');
    } finally {
      isLoading(false);
    }
  }

}
