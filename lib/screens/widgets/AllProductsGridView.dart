import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart/Cart.dart';
import '../cart/CartProvider.dart';
import '../products/FiltersBottomSheet.dart';

class Product {
  final int id;
  final String title;
  final String price;
  final String images;
  final String brand;
  final String category;
  final String vendors;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.images,
      required this.brand,
      required this.category,
      required this.vendors});
}

class AllProductsGrid extends StatefulWidget {
  final ProductFilters? appliedFilters;

  AllProductsGrid({this.appliedFilters});

  @override
  State<AllProductsGrid> createState() => _AllProductsGridState();
}

final initialQuantity = 1;
ValueNotifier<int>? quantityNotifier;

class _AllProductsGridState extends State<AllProductsGrid> {
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    // Initialize the filtered products list with all products
    filteredProducts = gridMap;
    // Apply filters based on the provided widget.appliedFilters
    applyFilters(widget.appliedFilters!);
  }

  void applyFilters(ProductFilters filters) {
    // Apply filters to the products list
    filteredProducts = gridMap.where((product) {
      // Check each filter criterion
      final priceInRange = int.parse(product.price) >= filters.minPrice &&
          int.parse(product.price) <= filters.maxPrice;
      final brandSelected = filters.selectedBrands.isEmpty ||
          filters.selectedBrands.contains(product.brand);
      final categorySelected = filters.selectedCategories.isEmpty ||
          filters.selectedCategories.contains(product.category);
      final vendorSelected = filters.selectedVendors.isEmpty ||
          filters.selectedVendors.contains(product.vendors);

      // Include the product iintn the filtered list if all criteria match
      return priceInRange &&
          brandSelected &&
          categorySelected &&
          vendorSelected;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    Future<void> saveData(int index) async {
      final id = index;
      final productId = index.toString();
      final productName = gridMap[index].title;
      final initialPrice = int.parse(gridMap[index].price);
      final productPrice = int.parse(gridMap[index].price);
      final quantity = 1;
      final unitTag = "1";
      final image = gridMap[index].images;
      cart.dbHelper
          .insert(
        Cart(
          id: index,
          productId: index.toString(),
          productName: gridMap[index].title,
          initialPrice: int.parse(gridMap[index].price),
          productPrice: int.parse(gridMap[index].price),
          quantity: ValueNotifier(1),
          unitTag: 1.toString(),
          image: gridMap[index].images,
        ),
      )
          .then((value) {
        debugPrint(value.image);
        debugPrint(cart.getData().toString());
        debugPrint("cart list");
        cart.addTotalPrice(double.parse(gridMap[index].price));
        cart.addCounter();
        debugPrint(cart.counter.toString());

        print('Product Added to cart');
      }).onError((error, stackTrace) {
        print('Product Added to cart');
        print("whats this null");
        print(error.toString());
      });
    }

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
        itemCount: filteredProducts.length,
        itemBuilder: (_, index) {
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
                        arguments: filteredProducts.elementAt(index));
                  },
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                    child: Image.network(
                      "${filteredProducts.elementAt(index).images}",
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${filteredProducts.elementAt(index).title}",
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
                        "${filteredProducts.elementAt(index).price}",
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
                              saveData(index);
                            },
                            icon: Icon(
                              CupertinoIcons.cart,
                            ),
                          ),
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
