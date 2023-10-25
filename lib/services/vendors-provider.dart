import 'package:flutter/material.dart';
import 'package:waridionline/services/cart-provider.dart';
import 'package:waridionline/services/product-service.dart';
import 'package:waridionline/services/services.dart';

import '../screens/home/vendors-list.dart';
import '../screens/models/others/vendors.dart';

class VendorProvider with ChangeNotifier {
  VendorProvider() {
    // Initialize the products with data from the database

    loadVendors();
  }

  List<Vendor> _vendors = [];
  Services _vendorService = Services();

  List<Vendor> get vendors => _vendors;
  Map<String, List<Vendor>> _vendorsByCategory = {};
  Map<String, List<Vendor>> get vendorsByCategory => _vendorsByCategory;
  Future<void> loadVendors() async {
    try {
      final vendors = await _vendorService.loadVendorsFromJson();
      _vendors = vendors;
    } catch (e) {
      print('Error loading vendors: $e');
    }
    notifyListeners();
  }

  Map<String, List<Vendor>> groupVendorsByCategory(List<Vendor> vendors) {
    Map<String, List<Vendor>> groupedVendors = {};

    for (final vendor in vendors) {
      if (!groupedVendors.containsKey(vendor.category)) {
        groupedVendors[vendor.category] = [];
      }
      groupedVendors[vendor.category]!.add(vendor);
    }
    notifyListeners();
    return groupedVendors;
  }
}
