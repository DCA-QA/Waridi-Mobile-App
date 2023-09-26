import 'package:flutter/material.dart';
import 'package:waridionline/screens/widgets/AllProductsGridView.dart';
import 'package:waridionline/screens/widgets/CategoriesGrid.dart';
import 'package:waridionline/screens/widgets/VendorGridView.dart';

import 'home/Carousel.dart';
import 'widgets/CategoriesList.dart';
import 'widgets/ProductsGrid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                  AllProductsGrid()
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
