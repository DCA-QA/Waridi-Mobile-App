import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import 'package:waridionline/screens/widgets/products/all-products-grid-view.dart';
import '../../services/cart-provider.dart';
import '../../services/product-provider.dart';
import '../models/products/products.dart';
import 'package:badges/badges.dart' as badges;
import 'searchresults.dart';

class SearchPages extends StatefulWidget {
  const SearchPages({Key? key}) : super(key: key);

  @override
  State<SearchPages> createState() => _SearchPagesState();
}

class _SearchPagesState extends State<SearchPages> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context);
    return SafeArea(
      child: Column(
        children: [
          SizedBox(height: 10),
          PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: AppBar(
              backgroundColor: Colors.white,
              title: SizedBox(
                height: 50,
                child: Row(
                  children: [
                    // Image.asset(
                    //   'assets/images/waridi.png',
                    //   width: 60,
                    //   height: 150,
                    // ),
                    SizedBox(width: 8),
                    Expanded(
                        child: TextField(
                      controller: _searchController,
                      onChanged: (query) {
                        // Call a method in your ProductProvider to update the products list based on the search query
                        productProvider.searchProducts(query);
                      },
                      decoration: InputDecoration(
                        labelText: 'Search Products',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              20.0), // Adjust the radius as needed
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              actions: [
                context.watch<User>().basketItems.length != 0
                    ? badges.Badge(
                        badgeContent:
                            Text('${context.watch<User>().basketItems.length}'),
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
              ],
            ),
          ),
          // Add other content or widgets below the AppBar if needed

          Expanded(
            child: SearchResultsWidget(productProvider.searchResults),
          ),
        ],
      ),
    );
  }
}
