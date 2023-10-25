import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waridionline/screens/widgets/products/all-products-grid-view.dart';
import 'package:waridionline/screens/widgets/products/categories-grid.dart';
import 'package:waridionline/screens/widgets/vendors-grid-view.dart';
import 'package:badges/badges.dart' as badges;
import 'package:waridionline/screens/products/filters-bottom-sheet.dart';

import '../services/cart-provider.dart';
import '../services/product-provider.dart';
import 'home/carousel.dart';
import 'home/sidebar.dart';
import 'products/filters-bottom-sheet.dart';
import 'widgets/products/categories-list.dart';
import 'widgets/products/products-grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    final productsProvider = ProductsProvider();
    productsProvider.fetchProducts();
    loadSavedFilters();
  }

  ProductFilters _appliedFilters = ProductFilters(
    minPrice: 0,
    maxPrice: 200000,
    selectedBrands: [],
    selectedCategories: [],
    selectedVendors: [],
  );

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
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: AppBar(
              backgroundColor: Colors.white,
              title: SizedBox(
                height: 50,
                // width: 200, // Adjust the width as needed
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/waridi.png', // Replace with the path to your logo image
                      width: 60, // Adjust the width as needed
                      height: 150, // Adjust the height as needed
                    ),
                    SizedBox(
                        width: 8), // Add spacing between logo and search field
                  ],
                ),
              ),
              actions: [
                context.watch<User>().basketItems.length != 0
                    ? badges.Badge(
                        badgeContent:
                            Text('${context.watch<User>().basketItems.length}'),
                        position: badges.BadgePosition.topEnd(top: 0, end: 3),
                        badgeAnimation: badges.BadgeAnimation.slide(
                          curve: Curves.easeInCubic,
                        ),
                        showBadge: true,
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: Colors.amber,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.shopping_cart),
                          iconSize: 27,
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/cartScreen',
                            );
                          },
                        ),
                      )
                    : Text(""),
              ])),
      drawer: DrawerWidget(),
      body: Column(
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
                    AllProductsGrid(
                      appliedFilters: _appliedFilters,
                    )
                  ],
                ),
              ],
            ),
          ),

          // ))
        ],
      ),
    );
  }

  void navigateToProducts(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/allProductScreen',
    );
  }
}
