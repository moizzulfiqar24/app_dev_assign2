import 'dart:convert';
import 'package:app_dev_assign2/products/models/products_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<ProductModel>> getAll() async {
    const url = 'https://fakestoreapi.com/products'; 
    final uri = Uri.parse(url);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List;
        final products =
            jsonData.map((item) => ProductModel.fromJson(item)).toList();
        return products;
      }
    } catch (e) {
      throw e.toString();
    }

    return [];
  }
}
