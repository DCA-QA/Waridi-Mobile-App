import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String productImage;
  final String productTitle;
  final String productName;
  final double productPrice;
  final double originalPrice;
  final int quantity;
  final Function() onRemove;
  final Function() onAdd;
  final Function() onSubtract;

  CartItem({
    required this.productImage,
    required this.productTitle,
    required this.productName,
    required this.productPrice,
    required this.originalPrice,
    required this.quantity,
    required this.onRemove,
    required this.onAdd,
    required this.onSubtract,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:8.0,right:10.0),
            child: GestureDetector(
              onTap: () {
                // widget.handleArticleLogoTap();
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  productImage,
                  fit: BoxFit.contain,
                  width: 100,
                  height: 100,
                  // When the image fails to load, you can provide a solid color as the background.
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 100,
                      height: 100,
                      color: Colors
                          .grey, // Set the background color when the image fails to load
                    );
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productTitle, style: TextStyle(fontSize: 16.0)),
                Row(
                  children: [
                    Text('\$$productPrice', style: TextStyle(fontSize: 16.0)),
                    SizedBox(width: 8.0),
                    Text(
                      '\$$originalPrice',
                      style: TextStyle(
                        fontSize: 16.0,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(icon: Icon(Icons.remove), onPressed: onSubtract),
                  Text(quantity.toString()), // Display quantity
                  IconButton(icon: Icon(Icons.add), onPressed: onAdd),
                ],
              ),
              IconButton(icon: Icon(Icons.delete), onPressed: onRemove),
            ],
          ),
        ],
      ),
    );
  }
}
