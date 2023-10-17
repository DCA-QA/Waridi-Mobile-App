import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waridionline/screens/models/user_model.dart';

import '../../../services/user-services.dart';
import '../../cartoperations/models/products.dart';
import '../../products/filters-bottom-sheet.dart';

class AllProductsGrid extends StatefulWidget {
  final ProductFilters? appliedFilters;

  AllProductsGrid({this.appliedFilters});

  @override
  State<AllProductsGrid> createState() => _AllProductsGridState();
}

final initialQuantity = 1;
ValueNotifier<int>? quantityNotifier;

class _AllProductsGridState extends State<AllProductsGrid> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    // Initialize the filtered products list with all products

    // Apply filters based on the provided widget.appliedFilters
    // applyFilters(widget.appliedFilters!);
    getAllProducts();
  }

  Future<void> getAllProducts() async {
    products = await context.read<UserService>().getAllProducts();
    setState(() {});
  }

  // void applyFilters(ProductFilters filters) {
  //   // Apply filters to the products list
  //   filteredProducts = gridMap.where((product) {
  //     // Check each filter criterion
  //     final priceInRange = int.parse(product.price) >= filters.minPrice &&
  //         int.parse(product.price) <= filters.maxPrice;
  //     final brandSelected = filters.selectedBrands.isEmpty ||
  //         filters.selectedBrands.contains(product.brand);
  //     final categorySelected = filters.selectedCategories.isEmpty ||
  //         filters.selectedCategories.contains(product.category);
  //     final vendorSelected = filters.selectedVendors.isEmpty ||
  //         filters.selectedVendors.contains(product.vendors);

  //     // Include the product iintn the filtered list if all criteria match
  //     return priceInRange &&
  //         brandSelected &&
  //         categorySelected &&
  //         vendorSelected;
  //   }).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          mainAxisExtent: 310,
        ),
        itemCount: products.length,
        itemBuilder: (_, index) {
          debugPrint(index.toString());
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                16.0,
              ),
              color: Colors.grey.shade100,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/productDetails',
                        arguments: index);
                  },
                  child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 5),
                          child: Image.network(
                            "${products.elementAt(index).image}",
                            height: 150,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit
                                .contain, // Fit the image within the constraints
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 8, right: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${products.elementAt(index).title}",
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.subtitle1!.merge(
                              const TextStyle(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        "${products.elementAt(index).price}",
                        style: Theme.of(context).textTheme.subtitle2!.merge(
                              TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.grey.shade500,
                              ),
                            ),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.heart,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              context.read<User>().addFirstItemToBasket(
                                  products.elementAt(index));
                            },
                            icon: Icon(
                              CupertinoIcons.cart,
                            ),
                          ),
                          Text(
                              context.read<User>().basketTotalMoney.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
