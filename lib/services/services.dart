import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waridionline/screens/cart/CartProvider.dart';

import '../screens/cart/Cart.dart';
import '../screens/widgets/AllProductsGridView.dart';

class Services {
  List<Product> filterProducts(
    List<Product> products,
    List<String> selectedCategories,
    List<String> selectedVendors,
    double minPrice,
    double maxPrice,
  ) {
    return products.where((product) {
      // Filter by category
      if (selectedCategories.isNotEmpty &&
          !selectedCategories.contains(product.category)) {
        return false;
      }

      // Filter by vendor
      if (selectedVendors.isNotEmpty &&
          !selectedVendors.contains(product.vendors)) {
        return false;
      }

      // Filter by price
      if (double.parse(product.price) < minPrice ||
          double.parse(product.price) > maxPrice) {
        return false;
      }

      return true;
    }).toList();
  }

 
}
