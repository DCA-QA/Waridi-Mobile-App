import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/vendors-provider.dart';
import '../widgets/vendor-item.dart';

class VendorListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            centerTitle: true,
            title: Text(
              "Popular Vendors",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            expandedHeight: 70, // Adjust this value as needed
            floating: false,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Consumer<VendorProvider>(
              builder: (context, vendorProvider, child) {
                final vendors = vendorProvider.vendors;

                return ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: vendors.length,
                  itemBuilder: (context, index) {
                    final vendor = vendors[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 16, left: 10, right: 10),
                      child: VendorItem(vendor: vendor),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
