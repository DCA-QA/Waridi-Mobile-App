import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:waridionline/screens/home.dart';
import 'package:waridionline/screens/home/help.dart';
import 'package:waridionline/screens/home/more.dart';

import '../search/search.dart';
import '../home/vendors-list.dart';
import '../../services/cart-provider.dart';
import '../orders/orderdetails.dart';
import '../orders/orders-list.dart';
import '../home/sidebar.dart';
import 'vendors-grid-view.dart';

int currentPageIndex = 0;

class NavigationBarBottom extends StatefulWidget {
  const NavigationBarBottom({
    super.key,
  });

  @override
  State<NavigationBarBottom> createState() => _NavigationBarBottomState();
}

class _NavigationBarBottomState extends State<NavigationBarBottom> {
  NavigationDestinationLabelBehavior labelBehavior =
      NavigationDestinationLabelBehavior.alwaysShow;

  @override
  void initState() {
    super.initState();
    getAllBasketItems();
  }

  int badgeL = 0;
  Future<void> getAllBasketItems() async {
    final products = Provider.of<User>(context, listen: false);
    badgeL = products.basketItems.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: [
          HomePage(),
          SearchPages(),
          VendorListView(),
          ChatApp(),
          More()
        ][currentPageIndex],
        bottomNavigationBar: NavigationBar(
          labelBehavior: labelBehavior,
          selectedIndex: currentPageIndex,
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
              print(currentPageIndex);
              print(index);
            });
          },
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.shopping_cart),
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.people),
              icon: Icon(Icons.people),
              label: 'Vendors',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.help_center),
              icon: Icon(Icons.help_center_rounded),
              label: 'Help',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.more_horiz),
              icon: Icon(Icons.more_horiz_rounded),
              label: 'More',
            ),
          ],
        ));
  }
}
