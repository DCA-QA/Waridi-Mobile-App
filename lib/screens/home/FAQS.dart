import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

import '../widgets/expansion-widget.dart';


class FAQS extends StatefulWidget {
  const FAQS({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _FAQSState createState() => _FAQSState();
}

class _FAQSState extends State<FAQS> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardC = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardD = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardE = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardF = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardG = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardH = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardI = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardJ = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardK = GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardL = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        // backgroundColor: Colors.grey,
        title: Text('FAQS',style:Theme.of(context).textTheme.bodyMedium),
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTileWidget(
            cardA: cardA,
            flatButtonStyle: flatButtonStyle,
            cardB: cardA,
            number: "A",
            question: "What is e-commerce?",
            answer:
                "E-commerce refers to the buying and selling of goods and services over the internet.",
          ),
          ExpansionTileWidget(
            cardB: cardB,
            flatButtonStyle: flatButtonStyle,
            cardA: cardB,
            number: "B",
            question: "What are the key benefits of e-commerce for businesses?",
            answer:
                "E-commerce offers benefits such as a wider customer reach, reduced overhead costs, 24/7 operation, and access to valuable customer data.",
          ),
          ExpansionTileWidget(
            cardB: cardC,
            flatButtonStyle: flatButtonStyle,
            cardA: cardC,
            number: "C",
            question: "What is an online marketplace, and how does it work?",
            answer:
                "An online marketplace is a platform where multiple sellers can list and sell their products or services, and customers can make purchases from various sellers through a single website.",
          ),
          ExpansionTileWidget(
            cardB: cardD,
            flatButtonStyle: flatButtonStyle,
            cardA: cardD,
            number: "D",
            question: "What is a payment gateway in e-commerce?",
            answer:
                "A payment gateway is a secure service that facilitates online payments by transmitting payment information between a customer's browser and the merchant's website.",
          ),
          ExpansionTileWidget(
            cardB: cardE,
            flatButtonStyle: flatButtonStyle,
            cardA: cardE,
            number: "E",
            question: "What are the different types of e-commerce models?",
            answer:
                "E-commerce models include B2C (business-to-consumer), B2B (business-to-business), C2C (consumer-to-consumer), and more, each serving a specific market and audience.",
          ),
          ExpansionTileWidget(
            cardB: cardF,
            flatButtonStyle: flatButtonStyle,
            cardA: cardF,
            number: "F",
            question: "What is a shopping cart in online retail?",
            answer:
                "A shopping cart is a virtual container that allows customers to add and manage items they wish to purchase while shopping online.",
          ),
          ExpansionTileWidget(
            cardB: cardG,
            flatButtonStyle: flatButtonStyle,
            cardA: cardG,
            number: "G",
            question:
                "Why are product descriptions and images important in e-commerce?",
            answer:
                "Product descriptions and images provide essential information about a product's features and appearance, helping customers make informed purchase decisions.",
          ),
          ExpansionTileWidget(
            cardB: cardH,
            flatButtonStyle: flatButtonStyle,
            cardA: cardH,
            number: "H",
            question:
                "How can e-commerce businesses ensure the security of customer data?",
            answer:
                "E-commerce businesses should implement secure payment gateways, use SSL certificates for encryption, update security measures regularly, and comply with data protection regulations.",
          ),
          ExpansionTileWidget(
            cardB: cardI,
            flatButtonStyle: flatButtonStyle,
            cardA: cardI,
            number: "I",
            question:
                "What role do customer reviews and ratings play in e-commerce?",
            answer:
                "Customer reviews and ratings provide valuable feedback, influence purchasing decisions, and build trust in a brand or product.",
          ),
          ExpansionTileWidget(
            cardB: cardJ,
            flatButtonStyle: flatButtonStyle,
            cardA: cardJ,
            number: "J",
            question: "What are some emerging trends in e-commerce?",
            answer:
                "Emerging e-commerce trends include mobile commerce (m-commerce), augmented reality shopping experiences, personalized recommendations, sustainable practices, and the use of AI and chatbots for customer support.",
          ),
        ],
      ),
    );
  }
}
