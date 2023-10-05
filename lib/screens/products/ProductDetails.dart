import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:provider/provider.dart';
import 'package:waridionline/screens/widgets/ShoppingCart.dart';

import '../cart/Cart.dart';
import '../cart/CartProvider.dart';
import '../widgets/AllProductsGridView.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Product? product;

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
    final shoppingCart = Provider.of<ShoppingCart>(context);
    _showCartBadge = _cartBadgeAmount > 0;
    Widget _shoppingCartBadge() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: badges.Badge(
          position: badges.BadgePosition.topEnd(top: 0, end: 3),
          badgeAnimation: badges.BadgeAnimation.slide(
              // disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
              // curve: Curves.easeInCubic,
              ),
          showBadge: _showCartBadge,
          badgeStyle: badges.BadgeStyle(
            badgeColor: color,
          ),
          badgeContent: Text(
            5.toString(),
            style: TextStyle(color: Colors.white),
          ),
          child: IconButton(
              icon: Icon(Icons.shopping_cart), iconSize: 27, onPressed: () {}),
        ),
      );
    }

    Widget buildStarRatings(double rating) {
      List<Widget> stars = [];
      for (int i = 0; i < rating.toInt(); i++) {
        stars.add(Icon(Icons.star, color: Colors.orange));
      }
      if (rating - rating.toInt() > 0) {
        stars.add(Icon(Icons.star_half, color: Colors.orange));
      }
      return Row(children: stars);
    }

    final cart = Provider.of<CartProvider>(context);
    void saveData(int index) {
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
        cart.addTotalPrice(double.parse(gridMap[index].price));
        cart.addCounter();
        print('Product Added to cart');
      }).onError((error, stackTrace) {
        print(error.toString());
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25)),
        actions: [_shoppingCartBadge()],
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(product!.images, height: 300, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.title,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8.0),
                Text(product.images),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    buildStarRatings(3.5),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              saveData(product.id);
                              if (quantity > 1) {
                                setState(() {
                                  quantity--;
                                });
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(quantity.toString()),
                        SizedBox(width: 5),
                        Container(
                          child: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
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
                setState(() {
                  _isAddedToCart = !_isAddedToCart;
                  _isAddedToCart ? _cartBadgeAmount++ : _cartBadgeAmount--;
                });
              },
              style: ElevatedButton.styleFrom(
                primary: _isAddedToCart ? Colors.grey : Colors.amber,
                minimumSize: Size(150, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: Text(
                _isAddedToCart ? 'Remove from Cart' : 'Add to Cart',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
