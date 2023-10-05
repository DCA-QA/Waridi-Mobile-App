import 'package:flutter/material.dart';
import 'package:waridionline/screens/home/VendorList.dart';

class Vendor {
  final String title;
  final String description;
  final String lastPosted;
  final String imageUrl;

  Vendor({
    required this.title,
    required this.description,
    required this.lastPosted,
    required this.imageUrl,
  });
}

class VendorListScreen extends StatefulWidget {
  @override
  _VendorListScreenState createState() => _VendorListScreenState();
}

class _VendorListScreenState extends State<VendorListScreen> {
  List<Vendor> vendors = [
    Vendor(
      title: "Vendor 1",
      description: "Description for Vendor 1",
      lastPosted: "3 days ago",
      imageUrl: "https://picsum.photos/500/300?random=1",
    ),
    Vendor(
      title: "Vendor 2",
      description: "Description for Vendor 2",
      lastPosted: "5 days ago",
      imageUrl: "https://picsum.photos/500/300?random=2",
    ),
    // Add more vendors with their information here
  ];

  void _onVendorTileTap(BuildContext context, Vendor vendor) {
    Navigator.pushNamed(context, '/categoryproduct');
    print('Tapped on ${vendor.title}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vendor List'),
      ),
      body: ListView.builder(
        itemCount: vendors.length,
        itemBuilder: (BuildContext context, int index) {
          final vendor = vendors[index];
          return GestureDetector(
            onTap: () => _onVendorTileTap(context, vendor),
            child: ListTile(
              leading: Image.network(
                vendor.imageUrl,
                width: 50,
                height: 50,
              ),
              title: Text(vendor.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(vendor.description),
                  Text('Last posted: ${vendor.lastPosted}'),
                ],
              ),
              trailing: Image.network(
                vendor.imageUrl,
                width: 50,
                height: 50,
              ),
            ),
          );
        },
      ),
    );
  }
}
