import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/cart-provider.dart';
import '../widgets/products/cart-item.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              // Clear cart action
              Provider.of<User>(context, listen: false).removeAll();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<User>(
              builder: (context, user, child) {
                if (user.basketProducts.isEmpty) {
                  return Center(child: Text('Your cart is empty.'));
                } else {
                  return ListView.builder(
                    itemCount: user.basketProducts.length,
                    itemBuilder: (context, index) {
                      final product = user.basketProducts.keys.toList()[index];
                      final quantity = user.basketProducts[product];
                      return CartItem(
                        productImage: product.image,
                        productTitle: product.title,
                        productName: product.description,
                        productPrice: product.price,
                        originalPrice: product.price,
                        quantity: quantity!,
                        onRemove: () {
                          // Remove item from cart action
                          user.decreseProduct(product);
                        },
                        onAdd: () {
                          // Add quantity action
                          user.incrementProduct(product);
                        },
                        onSubtract: () {
                          // Subtract quantity action
                          user.decreseProduct(product);
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
          // Checkout button at the bottom
          Container(
            width: MediaQuery.of(context).size.width *
                0.75, // Match the button width
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total"),
                Text(
                  context.watch<User>().basketTotalMoney.toString(),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ElevatedButton(
              onPressed: () {
                 Navigator.pushNamed(
                        context,
                        '/checkScreen',
                      );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFFFDF01), // Use FFDF01 color for the button
                minimumSize: Size(MediaQuery.of(context).size.width * 0.75, 40),

                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(4.0), // Set border radius to 0
                ),
              ),
              child: Text('CHECKOUT'),
            ),
          ),
        ],
      ),
    );
  }
}
