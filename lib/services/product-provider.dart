import 'package:flutter/material.dart';
import 'package:waridionline/services/product-service.dart';

import '../screens/models/products/products.dart';

class ProductsProvider with ChangeNotifier {
  ProductsProvider() {
    // Initialize the products with data from the database

    fetchProducts();
  }

  final UserService _userService =
      UserService(); // Replace with the actual path to your UserService

  List<Product> _products = [];
  List<Product> get products => _products;
  List<Product> _searchResults = [];
  List<Product> get searchResults => _searchResults;

  Future<void> fetchProducts() async {
    try {
      final products = await _userService.getAllProducts();
      _products = products;
      debugPrint("products first fetch");
      debugPrint(_products.toList().toString());
    } catch (e) {
      // Handle error (e.g., show an error message)
    }
    notifyListeners();
  }

  void setProducts(List<Product> products) {
    _products = products;
    notifyListeners(); // Notify listeners that the data has changed
  }

  void clearProducts() {
    _products = [];
    notifyListeners();
  }

  void searchProducts(String query) {
    _searchResults = _products.where((product) {
      return product.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
    notifyListeners();
  }

  Future<Product> fetchProductById(int id) async {
    try {
      final product = await _userService.fetchProductByID(id);
      return product;
    } catch (e) {
      // Handle error (e.g., show an error message)
      rethrow;
    }
  }
}
