import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waridionline/screens/cart/DBHelper.dart';

import '../widgets/AllProductsGridView.dart';
import 'Cart.dart';

  final List<Product> gridMap = [
    Product(
      id: 1,
      title: "Black Jeans with blue stripes",
      price: "245",
      images:
          "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      brand: "Dior",
      category: "Dress",
      vendors: "Masterpiece Art Gallery",
    ),
    Product(
      id: 2,
      title: "Red shoes with black stripes",
      price: "155",
      images:
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2hvZXN8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
      brand: "Nike",
      category: "Dress",
      vendors: "Happy Paws Pet Store",
    ),
    Product(
      id: 3,
      title: "Gamma shoes with beta brand.",
      price: "275",
      images:
          "https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      brand: "Addidas",
      category: "Shirts",
      vendors: "TechWizards IT Services",
    ),
    Product(
      id: 4,
      title: "Alpha t-shirt for alpha testers.",
      price: "25",
      images:
          "https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      brand: "Nike",
      category: "Skirts",
      vendors: "Timeless Jewelry Emporium",
    ),
    Product(
      id: 5,
      title: "Beta jeans for beta testers",
      price: "27",
      images:
          "https://images.unsplash.com/photo-1602293589930-45aad59ba3ab?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      brand: "Addidas",
      category: "Tops",
      vendors: "Luxury Living Furniture",
    ),
    Product(
      id: 6,
      title: "V&V model white t-shirts.",
      price: "55",
      images:
          "https://images.unsplash.com/photo-1554568218-0f1715e72254?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
      brand: "Sony",
      category: "Shorts",
      vendors: "Wasili sellers",
    ),
    Product(
      id: 7,
      title: "White sneaker with adidas logo",
      price: "255",
      images:
          "https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=725&q=80",
      brand: "Rolex",
      category: "Dress",
      vendors: "Wasili sellers",
    ),
    // Repeat the above products to add more items
  ];
 
class CartProvider with ChangeNotifier {
 DBHelper dbHelper = DBHelper();
 int _counter = 0;
 int _quantity = 1;
 int get counter => _counter;
 int get quantity => _quantity;
 

 double _totalPrice = 0.0;
 double get totalPrice => _totalPrice;

 List<Cart> cart = [];

 Future<List<Cart>> getData() async {
   cart = await dbHelper.getCartList();
   notifyListeners();
   return cart;
 }

 void _setPrefsItems() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setInt('cart_items', _counter);
   prefs.setInt('item_quantity', _quantity);
   prefs.setDouble('total_price', _totalPrice);
   notifyListeners();
 }

 void _getPrefsItems() async {
   SharedPreferences prefs = await SharedPreferences.getInstance();
   _counter = prefs.getInt('cart_items') ?? 0;
   _quantity = prefs.getInt('item_quantity') ?? 1;
   _totalPrice = prefs.getDouble('total_price') ?? 0;
 }

 void addCounter() {
   _counter++;
   _setPrefsItems();
   notifyListeners();
 }

 void removeCounter() {
   _counter--;
   _setPrefsItems();
   notifyListeners();
 }

 int getCounter() {
   _getPrefsItems();
   return _counter;
 }

 void addQuantity(int id) {
   final index = cart.indexWhere((element) => element.id == id);
   cart[index].quantity!.value = cart[index].quantity!.value + 1;
   _setPrefsItems();
   notifyListeners();
 }

 void deleteQuantity(int id) {
   final index = cart.indexWhere((element) => element.id == id);
   final currentQuantity = cart[index].quantity!.value;
   if (currentQuantity <= 1) {
     currentQuantity == 1;
   } else {
     cart[index].quantity!.value = currentQuantity - 1;
   }
   _setPrefsItems();
   notifyListeners();
 }

 void removeItem(int id) {
   final index = cart.indexWhere((element) => element.id == id);
   cart.removeAt(index);
   _setPrefsItems();
   notifyListeners();
 }

 int getQuantity(int quantity) {
   _getPrefsItems();
   return _quantity;
 }

 void addTotalPrice(double productPrice) {
   _totalPrice = _totalPrice + productPrice;
   _setPrefsItems();
   notifyListeners();
 }

 void removeTotalPrice(double productPrice) {
   _totalPrice = _totalPrice - productPrice;
   _setPrefsItems();
   notifyListeners();
 }

 double getTotalPrice() {
   _getPrefsItems();
   return _totalPrice;
 }
}