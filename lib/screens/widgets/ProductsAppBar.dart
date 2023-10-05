import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waridionline/screens/cart/CartProvider.dart';
import 'package:waridionline/screens/orders/OrdersList.dart';
import 'package:badges/badges.dart' as badges;

class ProductsAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      automaticallyImplyLeading: true,
      // leading: IconButton(
      //   icon: Icon(Icons.arrow_back),
      //   onPressed: () {
      //     Navigator.pop(
      //         context); // This will navigate back to the previous screen
      //   },

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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: badges.Badge(
            badgeContent:
                Consumer<CartProvider>(builder: (context, value, child) {
              return Text(
                value.getCounter().toString(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              );
            }),
            position: badges.BadgePosition.topEnd(top: 0, end: 3),
            badgeAnimation: badges.BadgeAnimation.slide(
              // disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
              curve: Curves.easeInCubic,
            ),
            showBadge: true,
            badgeStyle: badges.BadgeStyle(
              badgeColor: Colors.amber,
            ),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                iconSize: 27,
                onPressed: () {}),
          ),
        )
      ],
    );
  }
}
