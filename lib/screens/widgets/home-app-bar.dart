import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../../services/cart-provider.dart';

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
        height: 50,
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
        Consumer<User>(
          builder: (context, user, child) {
            return badges.Badge(
              badgeContent: Text(
                user.totalProduct.toString(),
                style: Theme.of(context)
                    .textTheme
                    .overline!
                    .copyWith(color: Colors.white),
              ),
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
            );
          },
        ),
      ],
    );
  }
}
