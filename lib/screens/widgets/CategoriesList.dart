import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  final String texToDisplay;
  final String? navigateTo;
  final VoidCallback? onpressed;
  CategoriesList(
      {super.key, required this.texToDisplay, this.navigateTo, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(texToDisplay,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)), // <-- Text
            SizedBox(
              width: 5,
            ),
            Image.asset("assets/images/waridi.png", width: 38, height: 38)
          ],
        ),
        TextButton(
            onPressed: onpressed,
            child: Text("SEE ALL",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 12)))
      ],
    );
  }
}
