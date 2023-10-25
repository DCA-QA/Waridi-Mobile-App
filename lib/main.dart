import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:waridionline/screens/authentication/login.dart';
import 'package:waridionline/screens/authentication/register.dart';

import 'package:waridionline/screens/home/blogs.dart';
import 'package:waridionline/screens/home/blogdetails.dart';

import 'package:waridionline/screens/orders/checkout-screen.dart';
import 'package:waridionline/screens/orders/order-done.dart';
import 'package:waridionline/screens/products/products-details.dart';
import 'package:waridionline/screens/products/products-screen.dart';
import 'package:waridionline/screens/settings.dart';
import 'package:waridionline/screens/widgets/products/all-products-grid-view.dart';
import 'package:waridionline/services/filter-provider.dart';
import 'package:waridionline/services/product-provider.dart';
import 'package:waridionline/services/vendors-provider.dart';

import 'screens/home/help.dart';
import 'screens/home/notifications.dart';
import 'screens/home/product-categories-screen.dart';
import 'screens/search/search.dart';
import 'screens/home/vendors-list.dart';
import 'screens/products/cart-screen.dart';
import 'services/DBHelper.dart';
import 'services/cart-provider.dart';

import 'screens/orders/orderdetails.dart';
import 'screens/orders/orders-list.dart';
import 'screens/products/categories-screen.dart';
import 'screens/products/FeedScreen.dart';
import 'screens/products/filters-bottom-sheet.dart';
import 'screens/widgets/navigation-bar-bottom.dart';

import 'services/product-service.dart';

DatabaseHelper _databaseHelper = DatabaseHelper();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<User>(create: (context) => User()),
    Provider<UserService>(create: (context) => UserService()),
    ChangeNotifierProvider<ProductsProvider>(
        create: (context) => ProductsProvider()),
    ChangeNotifierProvider<FilterProvider>(
        create: (context) => FilterProvider()),
        ChangeNotifierProvider<VendorProvider>(
        create: (context) => VendorProvider()),
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
          titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.normal),
          bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'),
        ),
      ),
      initialRoute: '/',
      // defaultTransition: Transition.native,
      // translations: MyTranslations(),
      locale: Locale('pt', 'BR'),
     
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
        "/checkScreen": (context) => Checkout(),
        '/orderDone': (context) => OrderDoneScreen(),
        "/cartScreen": (context) => CartScreen(),
        "/categoriesScreen": (context) => CategoriesScreen(title: "Categories"),
        "/settingsScreen": ((context) => SettingsScreen()),
        "/blogs": ((context) => BlogScreen()),
        "/blogsDetails": ((context) => BlogsDetails()),
        "/vendors": ((context) => VendorListView()),
        "/categoryproduct": ((context) => ProductsCategoriesScreen()),
        "/notifications": ((context) => NotificationsScreen()),
        "/chatapp": ((context) => ChatApp()),
        "/search": ((context) => SearchPages())
      },
    );
  }
}
