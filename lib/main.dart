import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:waridionline/screens/authentication/login.dart';
import 'package:waridionline/screens/authentication/register.dart';

import 'package:waridionline/screens/home/blogs.dart';
import 'package:waridionline/screens/home/blogdetails.dart';

import 'package:waridionline/screens/orders/CheckoutScreen.dart';
import 'package:waridionline/screens/products/products-details.dart';
import 'package:waridionline/screens/products/products-screen.dart';
import 'package:waridionline/screens/settings.dart';
import 'package:waridionline/screens/widgets/products/all-products-grid-view.dart';

import 'screens/home/product-categories-screen.dart';
import 'screens/home/vendors-list.dart';
import 'screens/models/user_model.dart';
import 'screens/orders/PayViaCard.dart';
import 'screens/orders/OrderDetails.dart';
import 'screens/orders/OrdersList.dart';
import 'screens/products/categories-screen.dart';
import 'screens/products/FeedScreen.dart';
import 'screens/products/filters-bottom-sheet.dart';
import 'screens/widgets/navigation-bar-bottom.dart';


import 'services/user-services.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<User>(create: (context) => User()),
    Provider<UserService>(create: (context) => UserService()),
  ], child: Home()));
  FlutterNativeSplash.remove();
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    print(currentPageIndex);
    print(currentPageIndex);
    print(currentPageIndex);
    print(currentPageIndex);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Color.fromRGBO(179, 173, 176, 1),
        // primaryColor: Colors.lightBlue[800],
        fontFamily: 'Roboto',
        useMaterial3: true,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'),
        ),
      ),
      initialRoute: '/',
      // home:BlogsDetails(),
      routes: {
        '/': (context) => NavigationBarBottom(),
        '/allProducts': (context) => AllProductsGrid(),
        '/allProductScreen': (context) => ProductScreen(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/feedScreen': (context) => FeedScreen(),
        '/filters': (context) => FiltersBottomSheet(),
        '/productDetails': (context) => ProductDetailsScreen(),
        '/orders': (context) => OrdersScreen(),
        '/orderslist': (context) => OrderListScreen(),
        "/checkout": (context) => CheckoutScreen(),
        "/checkScreen": (context) => Checkout(),
        "/categoriesScreen": (context) => CategoriesScreen(title: "Categories"),
        "/settingsScreen": ((context) => SettingsScreen()),
        "/blogs": ((context) => BlogScreen()),
        "/blogsDetails": ((context) => BlogsDetails()),
        "/vendors": ((context) => VendorListScreen()),
        "/categoryproduct": ((context) => ProductsCategoriesScreen())
      },
    );
  }
}
