import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waridionline/screens/models/others/vendors.dart';

import '../../services/vendors-provider.dart';
import 'vendor-item.dart';

class VendorGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // Height of the grid items
      child: Consumer<VendorProvider>(
        builder: (context, vendorProvider, child) {
          final vendors = vendorProvider.vendors;

          return ListView.builder(
            physics: ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: vendors.length,
            itemBuilder: (context, index) {
              final vendor = vendors[index];
              return VendorItem(vendor: vendor);
            },
          );
        },
      ),
    );
  }
}
