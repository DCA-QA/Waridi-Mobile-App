import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waridionline/screens/models/products/products.dart';
import 'package:waridionline/services/DBHelper.dart';

import '../screens/models/products/cart-model.dart';
import 'product-service.dart';

class User extends ChangeNotifier {
  DatabaseHelper _databaseHelper = DatabaseHelper();

  User() {
    initializeBasketFromDatabase();
  }
  Map<Product, int> basketProducts = {};

  Future<void> initializeBasketFromDatabase() async {
    final List<CartModel> cartItems = await _databaseHelper.getCarts();
    debugPrint(cartItems.toList().toString());
    for (final cartItem in cartItems) {
      final product = await UserService().fetchProductByID(cartItem.product.id);
      debugPrint(product.toString());
      debugPrint("userinit class");

      if (product != null) {
        basketProducts[product] = cartItem.quantity;
        debugPrint(basketProducts[product].toString());
      }
    }
    notifyListeners();
  }

  bool inCart = false;

  List<Product> get basketItems => basketProducts.keys.toList();

  UnmodifiableListView<Product> get items => UnmodifiableListView(basketItems);

  double get basketTotalMoney {
    if (basketProducts.isEmpty) {
      return 0;
    } else {
      double _total = 0;
      basketProducts.forEach((key, value) {
        _total += key.price * value;
      });
      return _total;
    }
  }

  int get totalProduct {
    return basketProducts.length;
  }

  bool itemInCart(Product product) {
    return basketProducts.containsKey(product);
  }

  void addFirstItemToBasket(Product product) {
    if (basketProducts.containsKey(product)) {
      basketProducts.remove(product);
      _databaseHelper.deleteCartItem(product.id);
    } else {
      basketProducts[product] = 1;
      UserService().addProduct(product);
      _databaseHelper.insertCart(CartModel(product: product, quantity: 1));
      debugPrint("quantity2" + basketProducts[product].toString());
      debugPrint("new basket" + basketProducts.toString());
    }
    notifyListeners();
  }

  void incrementProduct(Product product) {
    if (basketProducts[product] == null) {
      addFirstItemToBasket(product);
      _databaseHelper.insertCart(CartModel(product: product, quantity: 1));
      return;
    } else {
      basketProducts[product] = basketProducts[product]! + 1;
      _databaseHelper.updateCartQuantity(product.id, basketProducts[product]!);
    }
    notifyListeners();
  }

  void decreseProduct(Product product) {
    if (basketProducts[product] == null) return;
    if (basketProducts[product]! > 0) {
      basketProducts.removeWhere((key, value) => key == product);
      _databaseHelper.deleteCartItem(product.id);
    } else {
      basketProducts[product] = basketProducts[product]! - 1;
      _databaseHelper.updateCartQuantity(product.id, basketProducts[product]!);
    }
    notifyListeners();
  }

  void removeAll() {
    items.clear();
    _databaseHelper.clearCart();
    notifyListeners();
  }
}
