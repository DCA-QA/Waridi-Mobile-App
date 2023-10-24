import 'package:flutter/material.dart';

class OrderDoneScreen extends StatefulWidget {
  @override
  _OrderDoneScreenState createState() => _OrderDoneScreenState();
}

class _OrderDoneScreenState extends State<OrderDoneScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Create an animation controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1), // Customize the animation duration
    );

    // Create an opacity animation
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    // Start the animation after a short delay (you can customize the duration)
    Future.delayed(Duration(milliseconds: 500), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Smiley emoji with animation
            FadeTransition(
              opacity: _opacityAnimation,
              child: Text(
                '😊',
                style: TextStyle(fontSize: 100),
              ),
            ),
            SizedBox(height: 20),
            // Text to indicate order success with animation
            FadeTransition(
              opacity: _opacityAnimation,
              child: Text(
                'Order successfully placed',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // You can add more widgets or information here, like an order summary
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

