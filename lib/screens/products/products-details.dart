import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:waridionline/screens/models/products/products.dart';
import '../../services/product-service.dart';


import '../../services/cart-provider.dart';
import '../widgets/products/all-products-grid-view.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int? product;

  ProductDetailsScreen({this.product});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;
  String selectedSize = 'Medium'; // Default selected size
  final Map<String, int> sizesInStock = {
    'Small': 10,
    'Medium': 20,
    'Large': 15,
    'XL': 5,
  };
  int cartItemCount = 0; // Number of items in the cart
  int _cartBadgeAmount = 3;
  late bool _showCartBadge;
  bool _isAddedToCart = false;
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
    // Access the product details from widget.product
    final product = widget.product;
    // final shoppingCart = Provider.of<ShoppingCart>(context);
    _showCartBadge = _cartBadgeAmount > 0;
  

    Widget buildStarRatings(double rating) {
      List<Widget> stars = [];
      int total = 5;
      for (int i = 0; i < rating.toInt(); i++) {
        stars.add(Icon(Icons.star, color: Colors.orange));
      }
      if (rating - rating.toInt() > 0) {
        stars.add(Icon(Icons.star_half, color: Colors.orange));
      }
      if (total - rating.toInt() > 0) {
        for (int i = 1; i < total - rating.toInt(); i++) {
          stars.add(Icon(Icons.star, color: Colors.black));
        }
      }
      return Row(children: stars);
    }

    final productID = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
        appBar: AppBar(
          title: Text('Product Details',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25)),
          actions: [
            badges.Badge(
              // badgeContent:
              //     Consumer<CartModel>(builder: (context, cart, child) {
              //   return Text('${cart.items.length}');
              // }),
              badgeContent: Text('${context.watch<User>().basketItems.length}'),

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
          ],
        ),
        body: FutureBuilder<Product>(
            future: UserService().fetchProductByID(productID),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                print('Error fetching product: ${snapshot.error}');
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData) {
                return Text('No data available');
              } else {
                final Product product = snapshot.data!;

                return ListView(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.network(product.image,
                        height: 300, fit: BoxFit.contain),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(product.title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8.0),
                          Text(product.description),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              buildStarRatings(double.parse(
                                  product.rating['rate'].toString())),
                              // Icon(Icons.star, color: Colors.orange),
                              // SizedBox(width: 4.0),
                              // Text(5.toString()),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Quantity:'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            bottomLeft: Radius.circular(8)),
                                        color: Colors.amber,
                                      ),
                                      child: IconButton(
                                        icon: Icon(Icons.remove),
                                        onPressed: () {
                                          context
                                              .read<User>()
                                              .decreseProduct(product);
                                        },
                                      )),
                                  SizedBox(width: 5),
                                  Text(context
                                              .watch<User>()
                                              .basketProducts[product] ==
                                          null
                                      ? "0"
                                      : "${context.watch<User>().basketProducts[product]}"),
                                  SizedBox(width: 5),
                                  Container(
                                    child: IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        context
                                            .read<User>()
                                            .incrementProduct(product);
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8)),
                                      color: Colors.amber,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Size:'),
                              DropdownButton<String>(
                                focusColor: Colors.amber,
                                value: selectedSize,
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedSize = newValue!;
                                  });
                                },
                                items: sizesInStock.keys.map((String size) {
                                  return DropdownMenuItem<String>(
                                    value: size,
                                    child: Row(
                                      children: [
                                        Text(size),
                                        SizedBox(width: 10),
                                        Text('Size: ${sizesInStock[size]}'),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<User>().addFirstItemToBasket(product);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: context.read<User>().itemInCart(product)
                              ? Colors.grey
                              : Colors.amber,
                          minimumSize: Size(150, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        child: Text(
                          //  icon: Icon(
                          //   CupertinoIcons.cart,
                          //   color: context.read<User>().itemInCart(product)
                          //       ? Colors.amber
                          //       : Colors.grey,
                          // ),
                          context.read<User>().itemInCart(product)
                              ? 'Remove from Cart'
                              : 'Add to Cart',
                        ),
                      ),
                    ),
                  ],
                );
              }
            }));
  }
}
