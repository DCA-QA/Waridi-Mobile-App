import 'package:flutter/material.dart';
import 'package:waridionline/screens/widgets/products/all-products-grid-view.dart';
import 'package:waridionline/screens/widgets/products/products-app-bar.dart';

import '../widgets/home-app-bar.dart';
import '../home/sidebar.dart';
import '../widgets/feeds/feed1.dart';

class FeedScreen extends StatelessWidget {
  final Widget? body; // Add this parameter
// {super.key, required this.texToDisplay, this.git remote -veTo, this.onpressed}
  const FeedScreen({Key? key, this.body}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: ProductsAppBar(),
        ),
        // drawer: DrawerWidget(),
        // body:ImageContainer()
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              SizedBox(height: 20),
              Feed1(),
              SizedBox(height: 20),
             Feed1()],
          ),
        ));
  }
}
