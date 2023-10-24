// products_categories_screen.dart

import 'package:flutter/material.dart';

import '../widgets/categories-card.dart';

class ProductsCategoriesScreen extends StatefulWidget {
  @override
  State<ProductsCategoriesScreen> createState() =>
      _ProductsCategoriesScreenState();
}

class _ProductsCategoriesScreenState extends State<ProductsCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Categories'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // Display 2 cards per row
        children: [
          CategoryCard(
              title: 'Arts',
              imageUrl: "https://picsum.photos/500/300?random=1"),
          CategoryCard(
              title: 'Dresses',
              imageUrl: "https://picsum.photos/500/300?random=2"),
          CategoryCard(
              title: 'Kids',
              imageUrl: "https://picsum.photos/500/300?random=3"),
          CategoryCard(
              title: "Men's Wear",
              imageUrl: "https://picsum.photos/500/300?random=4"),
          CategoryCard(
              title: 'Hats',
              imageUrl: "https://picsum.photos/500/300?random=5"),
          // Add more CategoryCard widgets for additional categories
        ],
      ),
    );
  }
}
