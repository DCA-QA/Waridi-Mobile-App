import 'package:flutter/material.dart';


class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      // leading: IconButton(
      //   icon: Icon(Icons.menu),
      //   color: Colors.black,
      //   onPressed: () {
      //     // TODO: Add functionality for menu button
      //   },
      // ),
       backgroundColor: Colors.white,
      title: SizedBox(
        height:50,
        // width: 200, // Adjust the width as needed
        child: Row(
          children: [
            Image.asset(
              'assets/images/waridi.png', // Replace with the path to your logo image
              width: 60, // Adjust the width as needed
              height: 150, // Adjust the height as needed
            ),
            SizedBox(width: 8), // Add spacing between logo and search field
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
