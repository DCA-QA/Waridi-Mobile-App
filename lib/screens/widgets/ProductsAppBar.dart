import 'package:flutter/material.dart';

class ProductsAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(
              context); // This will navigate back to the previous screen
        },
      ),
      backgroundColor: Colors.white,
      title: SizedBox(
        height: 50,
        // width: 200, // Adjust the width as needed
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search by name',
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          color: Colors.black,
          onPressed: () {
            // TODO: Add functionality for cart button
          },
        ),
      ],
    );
  }
}
