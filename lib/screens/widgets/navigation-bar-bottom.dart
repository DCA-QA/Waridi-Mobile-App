import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:waridionline/screens/home.dart';
import 'package:waridionline/screens/home/help.dart';
import 'package:waridionline/screens/home/more.dart';
import 'package:badges/badges.dart' as badges;
import 'package:waridionline/screens/products/filters-bottom-sheet.dart';
import 'package:waridionline/screens/widgets/home-app-bar.dart';
import 'package:waridionline/screens/widgets/vendors-grid-view.dart';

import '../search/search.dart';
import '../home/vendors-list.dart';
import '../../services/cart-provider.dart';
import '../orders/orderdetails.dart';
import '../orders/orders-list.dart';
import '../home/sidebar.dart';

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
    // products = await context.read<UserService>().getAllProducts();
    final products = Provider.of<User>(context, listen: false);
    badgeL = products.basketItems.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(56.0),
            child: AppBar(
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
                      SizedBox(
                          width:
                              8), // Add spacing between logo and search field
                      // Expanded(
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       color: Colors.grey,
                      //     ),
                      //     child: TextField(
                      //       decoration: InputDecoration(
                      //         hintText: 'Search by name',
                      //         border: InputBorder.none,
                      //         prefixIcon: Icon(Icons.search),
                              
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                actions: [
                  context.watch<User>().basketItems.length != 0
                      ? badges.Badge(
                          // badgeContent:
                          //     Consumer<CartModel>(builder: (context, cart, child) {
                          //   return Text('${cart.items.length}');
                          // }),
                          badgeContent: Text(
                              '${context.watch<User>().basketItems.length}'),

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
                        )
                      : Text(""),
                ])),
        drawer: DrawerWidget(),
        // body:ImageContainer()
        body: [
          HomePage(),
          SearchPages(),
          
          
          // OrderListScreen(),
          // OrdersScreen(),
          VendorListScreen(),
          // FiltersBottomSheet(),
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
