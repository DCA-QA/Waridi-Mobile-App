import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waridionline/screens/widgets/products/all-products-grid-view.dart';
import 'package:waridionline/screens/widgets/products/categories-grid.dart';
import 'package:waridionline/screens/widgets/vendors-grid-view.dart';

import 'home/carousel.dart';
import 'products/filters-bottom-sheet.dart';
import 'widgets/products/categories-list.dart';
import 'widgets/products/products-grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   ProductFilters _appliedFilters = ProductFilters(
    minPrice: 0,
    maxPrice: 200000,
    selectedBrands: [],
    selectedCategories: [],
    selectedVendors: [],
  );
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSavedFilters();
  }

  // Method to load saved filters from SharedPreferences
  Future<void> loadSavedFilters() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _appliedFilters.minPrice = prefs.getDouble('minPrice') ?? 0;
      _appliedFilters.maxPrice = prefs.getDouble('maxPrice') ?? 200000;
      _appliedFilters.selectedBrands =
          prefs.getStringList('selectedBrands') ?? [];
      _appliedFilters.selectedCategories =
          prefs.getStringList('selectedCategory') ?? [];
      _appliedFilters.selectedVendors =
          prefs.getStringList('selectedVendor') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 5,
        ),
        CarouselWidget(),
        Expanded(
          child: ListView(
            children: [
              Column(
                children: [
                  CategoriesList(texToDisplay: "TOP CATEGORIES"),
                  // GridViewProduct(liquors: hotdeals),
                  CategoriesGrid()
                ],
              ),
              Column(
                children: [
                  CategoriesList(texToDisplay: "HOT DEALS"),
                  // GridViewProduct(liquors: recentDeals),
                  ProductGridView()
                ],
              ),
              Column(
                children: [
                  CategoriesList(texToDisplay: "DISCOUNTED PRODUCTS"),
                  // GridViewProduct(liquors: recentDeals),
                  ProductGridView()
                ],
              ),
              Column(
                children: [
                  CategoriesList(texToDisplay: "VendorList"),
                  // GridViewProduct(liquors: recentDeals),
                  VendorGridView()
                ],
              ),
              Column(
                children: [
                  CategoriesList(
                    texToDisplay: "All Products",
                    onpressed: () => navigateToProducts(context),
                  ),
                  // GridViewProduct(liquors: recentDeals),
                  AllProductsGrid(appliedFilters: _appliedFilters,)
                ],
              ),
            ],
          ),
        ),

        // ))
      ],
    );
  }

  void navigateToProducts(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/allProductScreen',
    );
  }
}
