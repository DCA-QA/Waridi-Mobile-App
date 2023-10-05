import 'package:flutter/material.dart';
import 'package:waridionline/screens/home.dart';
import 'package:waridionline/screens/home/More.dart';

import 'package:waridionline/screens/products/FiltersBottomSheet.dart';
import 'package:waridionline/screens/widgets/Homeappbar.dart';
import 'package:waridionline/screens/widgets/VendorGridView.dart';

import '../home/VendorsList.dart';
import '../orders/OrderDetails.dart';
import '../orders/OrdersList.dart';
import 'SideBar.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: MyAppBar(),
        ),
        drawer: DrawerWidget(),
        // body:ImageContainer()
        body: [
          HomePage(),
          OrderListScreen(),
          // OrdersScreen(),
          VendorListScreen(),
          FiltersBottomSheet(),
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
              icon: Icon(Icons.shopping_cart_checkout_rounded),
              label: 'Orders',
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
