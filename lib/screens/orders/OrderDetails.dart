import 'package:flutter/material.dart';
import 'package:waridionline/screens/orders/checkout-screen.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details',
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 25)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(height: 16.0),
            Text(
              'Order Summary',
              style: TextStyle(fontSize: 18.0, color: Colors.amber),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Product Name 1',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text('\$19.99'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Product Name 1',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text('\$19.99'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Product Name 1',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text('\$19.99'),
              ],
            ),
            // Add more product rows here
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal:',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text('\$19.99'),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery Fees',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text('\$19.99'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Service Fees',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text('\$19.99'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Promotion Code',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text('sf4vw'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text('\$66.97'),
              ],
            ),

            SizedBox(height: 24.0),
            Text(
              'Delivery Address',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
            ),
            SizedBox(height: 8.0),
            Text('Building: Tower A'),
            Text('Name: John Doe'),
            Text('Location: Street Address, City, Country'),
            SizedBox(height: 24.0),
            Text('Vendor ',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.amber)),
            SizedBox(height: 8.0),
            Text('Vendor Name: ABC Store'),
            Text('Vendor Contact: vendor@example.com'),
            SizedBox(height: 24.0),
            Text('Payment Method',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.amber)),
            Text('Credit Card'),
            SizedBox(
              height: 10,
            ),
            Text('Order ID',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.amber)),
            Text('#123456789'),
            SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Delivered by: ',
                    style: TextStyle(color: Colors.amber),
                  ),
                  TextSpan(
                    text: 'Mwashe Berit',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height:19),
             Container(
              width: double.infinity,
               child: ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/')
                  ,
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber, // Set the button background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(0), // Set corner radius to 0
                    ),
                  ),
                ),
             ),
          ],
        ),
      ),
    );
  }
}
