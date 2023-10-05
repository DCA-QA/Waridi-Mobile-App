// products_categories_screen.dart

import 'package:flutter/material.dart';

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

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl; // Add imageUrl property

  CategoryCard({
    required this.title,
    required this.imageUrl, // Initialize imageUrl
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/allProducts');

          // Add navigation logic to the category-specific screen here
          // For demonstration purposes, we'll just print the selected category.
          print('Tapped on $title');
        },
        child: Column(
          children: <Widget>[
            // Display the image
            Image.network(
              imageUrl,
              width: 120, // Customize the width as needed
              height: 120, // Customize the height as needed
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
