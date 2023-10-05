import 'package:flutter/material.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final data = {
    "Women": [
      "Dress",
      "Trousers",
      "Cargo Pants",
      "Tshirt",
      "Skirt",
      "shorts",
      "Sweater",
      "Jeans",
      "Court",
      "ActiveWear"
    ],
    "Children": [
      "Dress",
      "Trousers",
      "Cargo Pants",
      "Tshirt",
      "Skirt",
      "shorts",
      "Sweater",
      "Jeans",
      "Court",
      "ActiveWear"
    ],
    "Men": [
      "Dress",
      "Trousers",
      "Cargo Pants",
      "Tshirt",
      "Skirt",
      "shorts",
      "Sweater",
      "Jeans",
      "Court",
      "ActiveWear"
    ],
    "Boys": [
      "Dress",
      "Trousers",
      "Cargo Pants",
      "Tshirt",
      "Skirt",
      "shorts",
      "Sweater",
      "Jeans",
      "Court",
      "ActiveWear"
    ],
    "Girls": [
      "Dress",
      "Trousers",
      "Cargo Pants",
      "Tshirt",
      "Skirt",
      "shorts",
      "Sweater",
      "Jeans",
      "Court",
      "ActiveWear"
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.title, style: Theme.of(context).textTheme.bodyMedium),
      ),
      body: ScrollableListTabScroller(
        itemCount: data.length,
        tabBuilder: (BuildContext context, int index, bool active) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
            child: Text(
              data.keys.elementAt(index),
              style: !active
                  ? null
                  : TextStyle(fontWeight: FontWeight.bold, color: Colors.amber),
            ),
          ),
        ),
        itemBuilder: (BuildContext context, int index) => Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              data.keys.elementAt(index),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            ...data.values
                .elementAt(index)
                .asMap()
                .map(
                  (index, value) => MapEntry(
                    index,
                    ListTile(
                      leading: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        alignment: Alignment.center,
                        child: Text(index.toString()),
                      ),
                      title: Text(value),
                      trailing: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.blue,
                        size: 30.0,
                        textDirection: TextDirection.ltr,
                        semanticLabel:
                            'Icon', // Announced in accessibility modes (e.g TalkBack/VoiceOver). This label does not show in the UI.
                      ),
                    ),
                  ),
                )
                .values
          ],
        ),
      ),
    );
  }
}
