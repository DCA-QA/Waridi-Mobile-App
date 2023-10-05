// import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
// import 'package:mobile_app_3/src/constants/colors.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    super.key,
    required this.cardB,
    required this.flatButtonStyle,
    required this.cardA,
    required this.question,
    required this.answer,
    required this.number,
  });

  final GlobalKey<ExpansionTileCardState> cardB;
  final ButtonStyle flatButtonStyle;
  final GlobalKey<ExpansionTileCardState> cardA;
  final String question;
  final String answer;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ExpansionTileCard(
        initialElevation: 0.9,
        initiallyExpanded: true,
        key: cardB,
        expandedTextColor: Colors.amber,
        leading: CircleAvatar(child: Text(number)),
        title: Text(question,
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 16, color: Colors.black)),
        subtitle: Text(
          'Tap Me For Change',
          style:
              Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 8),
        ),
        children: <Widget>[
          const Divider(
            thickness: 0.2,
            height: 1.0,
          ),
          Align(
            // alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 15.0,
              ),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    textAlign: TextAlign.start,
                    answer,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          // ButtonBar(
          //   alignment: MainAxisAlignment.spaceAround,
          //   buttonHeight: 52.0,
          //   buttonMinWidth: 90.0,
          //   children: <Widget>[
          //     TextButton(
          //       style: flatButtonStyle,
          //       onPressed: () {
          //         cardA.currentState?.expand();
          //       },
          //       child: const Column(
          //         children: <Widget>[
          //           Icon(Icons.arrow_downward),
          //           Padding(
          //             padding: EdgeInsets.symmetric(vertical: 2.0),
          //           ),
          //           Text('Open'),
          //         ],
          //       ),
          //     ),
          //     TextButton(
          //       style: flatButtonStyle,
          //       onPressed: () {
          //         cardA.currentState?.collapse();
          //       },
          //       child: const Column(
          //         children: <Widget>[
          //           Icon(Icons.arrow_upward),
          //           Padding(
          //             padding: EdgeInsets.symmetric(vertical: 2.0),
          //           ),
          //           Text('Close'),
          //         ],
          //       ),
          //     ),
          //     TextButton(
          //       style: flatButtonStyle,
          //       onPressed: () {
          //         cardA.currentState?.toggleExpansion();
          //       },
          //       child: const Column(
          //         children: <Widget>[
          //           Icon(Icons.swap_vert),
          //           Padding(
          //             padding: EdgeInsets.symmetric(vertical: 2.0),
          //           ),
          //           Text('Toggle'),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
