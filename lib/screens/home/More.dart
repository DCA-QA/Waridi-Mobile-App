import 'package:flutter/material.dart';
import 'package:waridionline/screens/home/faqs.dart';
import 'package:waridionline/screens/orders/checkout-screen.dart';
import 'package:waridionline/screens/orders/orders-list.dart';

import '../products/categories-screen.dart';

class More extends StatefulWidget {
  const More({Key? key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            title: Text(
              "More",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            floating: false,
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ListTile(
                  leading: CircleAvatar(
                      backgroundColor: Colors.amber, child: Text("D")),
                  title: Text("FAQS",
                      style: Theme.of(context).textTheme.bodyMedium),
                  trailing: IconButton(
                    icon: Icon(Icons.navigate_next),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FAQS(title: "FAQS"),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
