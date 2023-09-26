import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class StarRatings extends StatelessWidget {
  const StarRatings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: 4,
      onValueChanged: (v) {
        //
        // setState(() {
        //   value = v;
        // });
      },
      starBuilder: (index, color) => Icon(
        Icons.star,
        color: color,
      ),
      starCount: 5,
      starSize: 20,
      // valueLabelColor: const Color(0xff9b9b9b),
      // valueLabelTextStyle: const TextStyle(
      //     color: Colors.white,
      //     fontWeight: FontWeight.w400,
      //     fontStyle: FontStyle.normal,
      //     fontSize: 12.0),
      // valueLabelRadius: 5,
      maxValue: 5,
      starSpacing: 1,
      maxValueVisibility: true,
      valueLabelVisibility: false,
      animationDuration: Duration(milliseconds: 1000),
      valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 0),
      valueLabelMargin: const EdgeInsets.only(right: 8),
      starOffColor: const Color(0xffe7e8ea),
      starColor: Colors.yellow,
    );
  }
}
