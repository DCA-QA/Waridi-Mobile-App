import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:search_page/search_page.dart';
import 'package:waridionline/screens/widgets/products/all-products-grid-view.dart';
import '../../services/product-provider.dart';
import '../models/products/products.dart';
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
          TextField(
            controller: _searchController,
            onChanged: (query) {
              // Call a method in your ProductProvider to update the products list based on the search query
              productProvider.searchProducts(query);
            },
            decoration: InputDecoration(labelText: 'Search Products'),
          ),
          Expanded(
            child: SearchResultsWidget(productProvider.searchResults),
          ),
        ],
      ),
    );
  }
}
