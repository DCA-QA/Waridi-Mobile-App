
import 'package:flutter/material.dart';
import 'package:waridionline/screens/authentication/Register.dart';


void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: RegisterApp());
  }
}

