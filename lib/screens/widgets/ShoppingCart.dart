import 'package:flutter/material.dart';

import 'AllProductsGridView.dart';

class ShoppingCart extends ChangeNotifier {
  Map<Product, int> items = {};

  void addToCart(Product product, int quantity) {
    if (items.containsKey(product)) {
      quantity++;
    } else {
      items[product] = quantity;
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    items.remove(product);
    notifyListeners();
  }

  int getTotalItems() {
    return items.values.reduce((sum, itemCount) => sum + itemCount);
  }
}
