import 'package:flutter/material.dart';
import 'package:waridionline/screens/home/FAQS.dart';
import 'package:waridionline/screens/orders/CheckoutScreen.dart';
import 'package:waridionline/screens/orders/OrdersList.dart';

import '../products/CategorieScreen.dart';

class More extends StatefulWidget {
  const More({super.key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        ListTile(
            leading:
                CircleAvatar(backgroundColor: Colors.amber, child: Text("A")),
            // Replace with your image source
            title: Text("Order List"),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward), // Replace with the desired icon
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        OrderListScreen(), // Replace with the destination screen
                  ),
                );
              },
            )),
        ListTile(
            leading:
                CircleAvatar(backgroundColor: Colors.amber, child: Text("B")),
            // Replace with your image source
            title: Text("Checkout"),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward), // Replace with the desired icon
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Checkout(), // Replace with the destination screen
                  ),
                );
              },
            )),
        ListTile(
            leading:
                CircleAvatar(backgroundColor: Colors.amber, child: Text("C")),
            // Replace with your image source
            title: Text("Categories"),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward), // Replace with the desired icon
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoriesScreen(
                        title:
                            "Categories Screen"), // Replace with the destination screen
                  ),
                );
              },
            )),
        ListTile(
            leading:
                CircleAvatar(backgroundColor: Colors.amber, child: Text("C")),
            // Replace with your image source
            title: Text("FAQS"),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward), // Replace with the desired icon
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FAQS(
                        title: "FAQS"), // Replace with the destination screen
                  ),
                );
              },
            ))
      ],
    ));
  }
}
