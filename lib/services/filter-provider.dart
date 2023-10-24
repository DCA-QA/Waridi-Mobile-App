import 'package:flutter/material.dart';

class FilterProvider with ChangeNotifier {
  double minPrice = 0;
  double maxPrice = 200000;
  List<String> selectedBrands = [];
  List<String> selectedCategories = [];
  List<String> selectedVendors = [];

  void updateFilters(
      double minPrice, double maxPrice, List<String> brands, List<String> categories, List<String> vendors) {
    this.minPrice = minPrice;
    this.maxPrice = maxPrice;
    this.selectedBrands = brands;
    this.selectedCategories = categories;
    this.selectedVendors = vendors;
    notifyListeners();
  }
 

   void resetFilters() {
    minPrice = 0;
    maxPrice = 200000;
    selectedBrands = [];
    selectedCategories = [];
    selectedVendors = [];
    notifyListeners();
  }
}
