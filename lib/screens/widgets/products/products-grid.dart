import 'package:flutter/material.dart';
import 'package:waridionline/screens/constants.dart';
import 'package:waridionline/screens/widgets/rating-stars.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(),
            child: Stack(
              children: [
                Column(
                  children: [
                    Image(
                      image: AssetImage(Constants.images[index]),
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      "OPRA NECKLACE",
                      style: TextStyle(fontSize: 14),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        StarRatings(),
                        SizedBox(width: 10),
                        Text("4"),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("Ksh  ${2000}",
                          style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      "-5 %",
                      style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold)
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
