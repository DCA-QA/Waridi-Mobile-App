
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:waridionline/screens/authentication/Register.dart';
import 'package:waridionline/screens/home/carousel.dart';


void main() {
 WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const Home());
  FlutterNativeSplash.remove();
}

class Home extends StatelessWidget {
  const Home({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyCarousel());
  }
}

