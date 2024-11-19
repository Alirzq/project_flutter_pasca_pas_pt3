import 'dart:convert';
import 'package:http/http.dart' as http;

class FakeStoreService {
  final String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to fetch products');
    }
  }
}
