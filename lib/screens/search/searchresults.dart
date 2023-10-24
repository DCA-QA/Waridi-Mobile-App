import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waridionline/services/product-provider.dart';

import '../../services/cart-provider.dart';
import '../models/products/products.dart';

class SearchResultsWidget extends StatelessWidget {
  final List<Product> searchResults;

  SearchResultsWidget(this.searchResults);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductsProvider>(builder: (context, provider, child) {
      final searchResults = provider.searchResults;

      if (searchResults.isEmpty) {
        return Center(child: Text('{..............}'));
      } else {
        return ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              final product = searchResults[index];
              return Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 10.0, left: 10, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.grey.shade100,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image on the left
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/productDetails',
                              arguments: product.id);
                        },
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            bottomLeft: Radius.circular(16.0),
                          ),
                          child: Image.network(
                            "${product.image}",
                            height: 150,
                            width: 150, // Adjust the width as needed
                            fit: BoxFit
                                .contain, // Fit the image within the constraints
                          ),
                        ),
                      ),

                      // Title, Price, and Add to Cart button
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${product.title}",
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .merge(
                                      const TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                "${product.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2!
                                    .merge(
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
                                      context
                                          .read<User>()
                                          .addFirstItemToBasket(product);
                                    },
                                    icon: Icon(
                                      CupertinoIcons.cart,
                                      color: context
                                              .read<User>()
                                              .itemInCart(product)
                                          ? Colors.amber
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      }
    });
  }
}
