import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BlogsDetails extends StatefulWidget {
  // final Product product;

  // BlogsDetails({});

  @override
  _BlogsDetailsState createState() => _BlogsDetailsState();
}

class _BlogsDetailsState extends State<BlogsDetails> {
  int cartItemCount = 0; // Number of items in the cart
  int _cartBadgeAmount = 3;
  late bool _showCartBadge;
  bool _isAddedToCart = false;
  Color color = Colors.red;
  @override
  Widget build(BuildContext context) {
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
            _cartBadgeAmount.toString(),
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

    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Details',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25)),
        // actions: [_shoppingCartBadge()],
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
             'https://picsum.photos/500/300?random=2',
              height: 300,
              fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Blog Details",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8.0),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla viverra libero euismod tortor dictum, euismod.',
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
