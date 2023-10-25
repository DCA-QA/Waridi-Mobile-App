import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:waridionline/main.dart';
import 'package:waridionline/screens/home.dart';
import 'package:waridionline/screens/widgets/navigation-bar-bottom.dart';

import '../screens/authentication/login.dart';
import '../screens/authentication/register.dart';
import '../screens/home/blogdetails.dart';
import '../screens/home/blogs.dart';
import '../screens/home/help.dart';
import '../screens/home/notifications.dart';
import '../screens/home/product-categories-screen.dart';
import '../screens/home/vendors-list.dart';
import '../screens/models/notifications/notifications.dart';
import '../screens/models/others/vendors.dart';
import '../screens/orders/checkout-screen.dart';
import '../screens/orders/order-done.dart';
import '../screens/orders/orderdetails.dart';
import '../screens/orders/orders-list.dart';
import '../screens/products/FeedScreen.dart';
import '../screens/products/cart-screen.dart';
import '../screens/products/categories-screen.dart';
import '../screens/products/filters-bottom-sheet.dart';
import '../screens/products/products-details.dart';
import '../screens/products/products-screen.dart';
import '../screens/search/search.dart';
import '../screens/settings.dart';
import '../screens/widgets/products/all-products-grid-view.dart';

class Services {
  double calculateVAT(double productPrice, double vatRate) {
    if (productPrice <= 0 || vatRate <= 0) {
      return 0.0;
    }

    double vatAmount = productPrice * (vatRate / 100);

    return double.parse(vatAmount.toStringAsFixed(2));
  }

  Future<List<NotificationModel>> loadNotifications() async {
    final jsonString = await rootBundle.loadString(
        'assets/jsonfiles/notifications.json'); // Replace with the path to your JSON file

    final List<dynamic> jsonList = json.decode(jsonString);
    final List<NotificationModel> notifications =
        jsonList.map((json) => NotificationModel.fromJson(json)).toList();

    return notifications;
  }

  Future<List<Vendor>> loadVendorsFromJson() async {
    final jsonString = await rootBundle.loadString(
        'assets/jsonfiles/vendors.json'); // Replace with the path to your JSON file

    final List<dynamic> jsonList = json.decode(jsonString);
    final List<Vendor> vendors =
        jsonList.map((json) =>Vendor.fromJson(json)).toList();

    return vendors;
   
    
  }
}
