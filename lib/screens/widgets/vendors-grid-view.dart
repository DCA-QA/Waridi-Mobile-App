import 'package:flutter/material.dart';

class VendorGridView extends StatelessWidget {
  final List<Vendor> vendors = [
    Vendor(
      image: "assets/images/vendor1.jpg",
      offerText: "50% off on all items!",
    ),
    Vendor(
      image: "assets/images/vendor2.jpg",
      offerText: "Limited-time offer. Don't miss out!",
    ),

    Vendor(
      image: "assets/images/vendor3.jpg",
      offerText: "50% off on all items!",
    ),
    Vendor(
      image: "assets/images/vendor1.jpg",
      offerText: "50% off on all items!",
    ),
    // Add more vendors here
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150, // Height of the grid items
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: vendors.length,
        itemBuilder: (context, index) {
          final vendor = vendors[index];
          return Container(
            width: MediaQuery.of(context).size.width *
                0.8, // Fixed width for each item
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage(vendor.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0),
                      ),
                      color: Colors
                          .grey.withOpacity(0.3), // You can use any background color you like
                    ),
                    padding: EdgeInsets.all(12.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        vendor.offerText,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Vendor {
  final String image;
  final String offerText;

  Vendor({required this.image, required this.offerText});
}
