import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_credit_card/custom_card_type_icon.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String cardNumber = '345678904567892';
  String expiryDate = '01-01-2026';
  String cardHolderName = 'Berit Mwashe';
  String cvvCode = '23232';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    late String selectedPaymentMethod = "0";
    return Scaffold(
        appBar: AppBar(
          title: Text("Checkout"),
          automaticallyImplyLeading: true,
          centerTitle: true,
        ),
        body: ListView(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 7.0, right: 7, top: 20),
              child: Container(
                decoration: BoxDecoration(
                  // color: const Color(0xff7c94b6),
                  border: Border.all(
                    color: Colors.black,
                    width: 0.3,
                  ),
                  // borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListTile(
                    title: Text("Shipping Address"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("123 Main Street\nCity, State, ZIP"),
                        Text("Change",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber)),
                      ],
                    ),
                    trailing: Radio<bool>(
                      value:
                          true, // Set to true if this address is selected, otherwise set to false
                      groupValue:
                          true, // Set to true if this address is selected, otherwise set to false
                      onChanged: (bool? value) {
                        // Handle radio button selection here
                      },
                    ),
                    onTap: () {
                      // Handle tap on the ListTile (e.g., navigate to another screen to change address)
                    },
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(15.0), // Adjust the padding as needed
                  child: Text(
                    "Payment",
                    style: TextStyle(
                      fontSize: 16.0, // Adjust the font size as needed
                      fontWeight:
                          FontWeight.bold, // Adjust the font weight as needed
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle the tap on the "Add New Card" portion
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.black, // Adjust the icon color as needed
                      ),
                      Padding(
                        padding:
                            EdgeInsets.all(8.0), // Adjust the padding as needed
                        child: Text(
                          "Add New Card",
                          style: TextStyle(
                            color:
                                Colors.black, // Adjust the text color as needed
                            fontSize: 16.0, // Adjust the font size as needed
                            fontWeight: FontWeight
                                .bold, // Adjust the font weight as needed
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: CreditCardWidget(
                      glassmorphismConfig: useGlassMorphism
                          ? Glassmorphism.defaultConfig()
                          : null,
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      bankName: 'Axis Bank',
                      frontCardBorder: !useGlassMorphism
                          ? Border.all(color: Colors.grey)
                          : null,
                      backCardBorder: !useGlassMorphism
                          ? Border.all(color: Colors.grey)
                          : null,
                      showBackView: isCvvFocused,
                      obscureCardNumber: true,
                      obscureCardCvv: true,
                      isHolderNameVisible: true,
                      cardBgColor: Colors.blueAccent,
                      // backgroundImage: 'assets/card_bg.png',
                      isSwipeGestureEnabled: true,
                      onCreditCardWidgetChange:
                          (CreditCardBrand creditCardBrand) {},
                      customCardTypeIcons: <CustomCardTypeIcon>[
                        CustomCardTypeIcon(
                          cardType: CardType.mastercard,
                          cardImage: Image.asset(
                            'assets/mastercard.png',
                            height: 48,
                            width: 48,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: CreditCardWidget(
                      glassmorphismConfig: useGlassMorphism
                          ? Glassmorphism.defaultConfig()
                          : null,
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      bankName: 'Axis Bank',
                      frontCardBorder: !useGlassMorphism
                          ? Border.all(color: Colors.grey)
                          : null,
                      backCardBorder: !useGlassMorphism
                          ? Border.all(color: Colors.grey)
                          : null,
                      showBackView: isCvvFocused,
                      obscureCardNumber: true,
                      obscureCardCvv: true,
                      isHolderNameVisible: true,
                      cardBgColor: Colors.blueAccent,
                      // backgroundImage: 'assets/card_bg.png',
                      isSwipeGestureEnabled: true,
                      onCreditCardWidgetChange:
                          (CreditCardBrand creditCardBrand) {},
                      customCardTypeIcons: <CustomCardTypeIcon>[
                        CustomCardTypeIcon(
                          cardType: CardType.mastercard,
                          cardImage: Image.asset(
                            'assets/mastercard.png',
                            height: 48,
                            width: 48,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: CreditCardWidget(
                      glassmorphismConfig: useGlassMorphism
                          ? Glassmorphism.defaultConfig()
                          : null,
                      cardNumber: cardNumber,
                      expiryDate: expiryDate,
                      cardHolderName: cardHolderName,
                      cvvCode: cvvCode,
                      bankName: 'Axis Bank',
                      frontCardBorder: !useGlassMorphism
                          ? Border.all(color: Colors.grey)
                          : null,
                      backCardBorder: !useGlassMorphism
                          ? Border.all(color: Colors.grey)
                          : null,
                      showBackView: isCvvFocused,
                      obscureCardNumber: true,
                      obscureCardCvv: true,
                      isHolderNameVisible: true,
                      cardBgColor: Colors.blueAccent,
                      // backgroundImage: 'assets/card_bg.png',
                      isSwipeGestureEnabled: true,
                      onCreditCardWidgetChange:
                          (CreditCardBrand creditCardBrand) {},
                      customCardTypeIcons: <CustomCardTypeIcon>[
                        CustomCardTypeIcon(
                          cardType: CardType.mastercard,
                          cardImage: Image.asset(
                            'assets/mastercard.png',
                            height: 48,
                            width: 48,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text("Other payment methods"),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListTile(
                  title: Text("Lipa Na M-Pesa"),
                  leading: Radio(
                    value: "Lipa Na M-Pesa",
                    groupValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text("Cash on Delivery"),
                  leading: Radio(
                    value: "Cash on Delivery",
                    groupValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text("Pay via PayPal"),
                  leading: Radio(
                    value: "Pay via PayPal",
                    groupValue: selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        selectedPaymentMethod = value.toString();
                      });
                    },
                  ),
                ),
                // RadioListTile(
                //   title: Text("Buy Goods"),
                //   value: "Buy Goods",
                //   groupValue: selectedPaymentMethod,
                //   onChanged: (value) {
                //     setState(() {
                //       selectedPaymentMethod = value.toString();
                //     });
                //   },
                // ),
                SizedBox(height: 16.0),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order Total",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
                  Text("KES 28,000",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w200))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery Fee",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
                  Text("KES 1000",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w200))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("VAT",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
                  Text("KES 2800",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w200))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Summary",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.bold)),
                  Text("KES 30,000",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12, fontWeight: FontWeight.w900))
                ],
              ),
            )
          ],
        ));
  }
}
