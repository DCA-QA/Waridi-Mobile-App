import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:waridionline/services/cart-provider.dart';

import '../../../services/product-provider.dart';
import '../../../services/product-service.dart';
import '../../models/products/products.dart';
import '../../products/filters-bottom-sheet.dart';

class AllProductsGrid extends StatefulWidget {
  final ProductFilters? appliedFilters;

  AllProductsGrid({this.appliedFilters});

  @override
  State<AllProductsGrid> createState() => _AllProductsGridState();
}

class _AllProductsGridState extends State<AllProductsGrid> {
  // List<Product> products = [];
  ProductFilters? appliedFilters;

  @override
  void initState() {
    super.initState();

    // getAllProducts();
  }

  // Future<void> getAllProducts() async {
  //   // products = await context.read<UserService>().getAllProducts();
  //   final products = Provider.of<ProductsProvider>(context, listen: false);
  //   products.fetchProducts();
  // }
  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<ProductsProvider>(context, listen: false);
    return Consumer<ProductsProvider>(
        builder: (context, productProvider, child) {
      final products = productProvider.products;

      if (products.isEmpty) {
        return SafeArea(child: Center(child: Text('.....')));
      } else {
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
            itemCount: products.length, // Use the products list from initState
            itemBuilder: (_, index) {
              //  products = product.products.toList();
              debugPrint(index.toString());
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
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
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
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
                          const SizedBox(height: 8.0),
                          Text(
                            "${products.elementAt(index).price}",
                            style: Theme.of(context).textTheme.subtitle2!.merge(
                                  TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                          ),
                          const SizedBox(height: 8.0),
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
                                  color: context
                                          .read<User>()
                                          .itemInCart(products.elementAt(index))
                                      ? Colors.amber
                                      : Colors.grey,
                                ),
                              ),
                              Text(''),
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
    });
  }
}
