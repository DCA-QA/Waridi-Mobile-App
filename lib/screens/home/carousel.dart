import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../widgets/Homeappbar.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

List<String> _images = [
  'assets/images/girl1.jpg',
  'assets/images/girl2.jpg',
  'assets/images/girl3.jpg',
  // Add more image assets here
];

class _CarouselWidgetState extends State<CarouselWidget> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     appBar: PreferredSize(
    //       preferredSize: Size.fromHeight(56.0),
    //       child: MyAppBar(),
    //     ),
    //     body: content());
    return content();
  }
}

Widget content() {
  return Container(
    height: 300,
    child: CarouselSlider(
      items: _images.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 3.0),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: AssetImage(i),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'WELCOME',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold,color:Colors.amber),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Home of Waridi Online',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ElevatedButton(
                          onPressed: () {
                            // Implement the action when the SHOP button is pressed.
                            print('SHOP button pressed');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.yellow,
                            textStyle: TextStyle(fontWeight: FontWeight.bold),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                          ),
                          child: Text('SHOP NOW',style:TextStyle(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ));
          },
        );
      }).toList(),
      // carouselController: buttonCarouselController,
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.9,
        aspectRatio: 2.0,
        initialPage: 2,
      ),
    ),
  );
}
