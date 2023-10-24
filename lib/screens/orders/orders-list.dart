import 'package:flutter/material.dart';
import 'package:waridionline/screens/orders/orderdetails.dart';

class Order {
  final String title;
  final String orderId;
  final String date;
  final double price;
  final String status;
  final String image;

  Order(
      {required this.title,
      required this.orderId,
      required this.date,
      required this.price,
      required this.status,
      required this.image});
}

class OrderListScreen extends StatelessWidget {
  final List<Order> orders = [
    Order(
        title: 'Store A',
        orderId: '12345',
        date: '2023-09-27',
        price: 99.99,
        status: 'Ongoing',
        image: "assets/images/girl1.jpg"),
    Order(
        title: 'Store B',
        orderId: '54321',
        date: '2023-09-26',
        price: 49.99,
        status: 'Completed',
        image: "assets/images/girl2.jpg"),
    Order(
        title: 'Store A',
        orderId: '12345',
        date: '2023-09-27',
        price: 99.99,
        status: 'Ongoing',
        image: "assets/images/girl3.jpg"),
    Order(
        title: 'Store B',
        orderId: '54321',
        date: '2023-09-26',
        price: 49.99,
        status: 'Completed',
        image: "assets/images/girl2.jpg"),
    Order(
        title: 'Store A',
        orderId: '12345',
        date: '2023-09-27',
        price: 99.99,
        status: 'Ongoing',
        image: "assets/images/girl3.jpg"),
    Order(
        title: 'Store B',
        orderId: '54321',
        date: '2023-09-26',
        price: 49.99,
        status: 'Completed',
        image: "assets/images/girl2.jpg"),
    // Add more orders as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order List',
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 25)),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return ListTile(
              leading: CircleAvatar(
                radius: 50.0, // Adjust the radius as needed
                backgroundImage: AssetImage(order.image),
                backgroundColor:
                    Colors.transparent, // Make the background transparent
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors
                          .white, // You can set the border color as needed
                      width: 2.0, // You can adjust the border width as needed
                    ),
                  ),
                ),
              ),
              // Replace with your image source
              title: Text(order.title),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('#${order.orderId}',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 12)),
                      Text('- ${order.date}',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 12)),
                      Text(' - ${order.price.toStringAsFixed(2)}',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(fontSize: 12)),
                    ],
                  ),
                  Text(order.status,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: 12,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              trailing: IconButton(
                icon:
                    Icon(Icons.navigate_next), // Replace with the desired icon
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OrdersScreen(), // Replace with the destination screen
                    ),
                  );
                },
              ));
        },
      ),
    );
  }
}
