import 'dart:async';

import 'package:flutter/material.dart';


class MyCarousel extends StatefulWidget {
  @override
  _MyCarouselState createState() => _MyCarouselState();
}

class _MyCarouselState extends State<MyCarousel> {
  int _currentIndex = 0;
  List<String> _images = [
    'assets/images/waridi.png',
    'assets/images/waridi.png',
    'assets/images/waridi.png',
    // Add more image assets here
  ];
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _stopTimer();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _images.length;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto Moving Carousel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCarousel(),
            _buildIndicator(),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        // Handle swipe gestures to change the image
        if (details.velocity.pixelsPerSecond.dx > 0) {
          _changeImage(-1); // Swipe right
        } else if (details.velocity.pixelsPerSecond.dx < 0) {
          _changeImage(1); // Swipe left
        }
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()
          ..scale(_currentIndex == 0 ? 1.0 : 0.8), // Zoom effect on the first image
        child: Image.asset(
          _images[_currentIndex],
          fit: BoxFit.cover,
          width: 300, // Customize the width of the image
          height: 200, // Customize the height of the image
        ),
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _images.asMap().entries.map((entry) {
        final int index = entry.key;
        return GestureDetector(
          onTap: () {
            setState(() {
              _currentIndex = index;
              _stopTimer();
              _startTimer(); // Restart the timer when tapping on an indicator
            });
          },
          child: Container(
            width: 10,
            height: 10,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == index ? Colors.blue : Colors.grey,
            ),
          ),
        );
      }).toList(),
    );
  }

  void _changeImage(int step) {
    int newIndex = _currentIndex + step;
    if (newIndex < 0) {
      newIndex = _images.length - 1;
    } else if (newIndex >= _images.length) {
      newIndex = 0;
    }
    setState(() {
      _currentIndex = newIndex;
      _stopTimer();
      _startTimer(); // Restart the timer when swiping to a new image
    });
  }
}
