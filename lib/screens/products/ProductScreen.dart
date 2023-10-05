import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waridionline/screens/products/FiltersBottomSheet.dart';
import 'package:waridionline/screens/widgets/AllProductsGridView.dart';
import 'package:waridionline/screens/widgets/ProductsAppBar.dart';

import '../widgets/Homeappbar.dart';
import '../widgets/SideBar.dart';

class ProductScreen extends StatefulWidget {
  final Widget? body; // Add this parameter
// {super.key, required this.texToDisplay, this.navigateTo, this.onpressed}
  const ProductScreen({Key? key, this.body}) : super(key: key);
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

void _openFiltersBottomSheet(BuildContext context) {
  showModalBottomSheet(
    shape: Border.all(),
    context: context,
    builder: (BuildContext context) {
      return FiltersBottomSheet();
    },
  );
}

class _ProductScreenState extends State<ProductScreen> {
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
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: ProductsAppBar(),
        ),
        // drawer: DrawerWidget(),
        // body:ImageContainer()
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 10, left: 10),
          child: ListView(
            children: [
              SizedBox(height: 4),
              ElevatedButton(
                onPressed: () => _openFiltersBottomSheet(context),
                child: Text(
                  'Apply Filters',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.amber, // Set the button background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(0), // Set corner radius to 0
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              AllProductsGrid(
          // Pass the loaded filters to AllProductsGrid
          appliedFilters: _appliedFilters,
        ),
            ],
          ),
        ));
  }
}
