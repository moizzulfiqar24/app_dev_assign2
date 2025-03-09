// import 'package:app_dev_assign2/products/models/products_model.dart';
// import 'package:app_dev_assign2/products/services/products_service.dart';
// import 'package:flutter/material.dart';

// class ProductProvider extends ChangeNotifier {
//   final _service = ProductService();
//   bool isLoading = false;

//   List<ProductModel> _products = [];
//   List<ProductModel> get products => _products;

//   Future<void> getAllProducts() async {
//     isLoading = true;
//     notifyListeners();

//     final response = await _service.getAll();
//     _products = response;

//     isLoading = false;
//     notifyListeners();
//   }
// }

import 'package:app_dev_assign2/products/models/products_model.dart';
import 'package:app_dev_assign2/products/services/products_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final _service = ProductService();
  bool isLoading = false;

  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future<void> getAllProducts() async {
    setLoading(true);
    final response = await _service.getAll();
    _products = response;
    setLoading(false);
  }
}
