
import 'package:flutter/material.dart';

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
