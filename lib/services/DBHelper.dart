import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:waridionline/services/product-service.dart';

import '../screens/models/products/cart-model.dart';
import '../screens/models/products/products.dart';

class DatabaseHelper {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'carts.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE carts(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            product_id INTEGER,
            quantity INTEGER
          )
        ''');
      },
    );
  }

  Future<void> insertCart(CartModel cart) async {
    final db = await database;
    await db.insert('carts', cart.toMap());
  }

  Future<List<CartModel>> getCarts() async {
    final db = await database;

    // Join the 'carts' and 'products' tables based on 'product_id'
    final List<Map<String, dynamic>> cartMaps = await db.rawQuery('''
    SELECT carts.product_id, carts.quantity
    FROM carts
  
  ''');
    List<CartModel> cartItems = [];
    for (final cartMap in cartMaps) {
      final int productId = cartMap['product_id'];
      final int quantity = cartMap['quantity'];

      // Retrieve the product for the given product_id
      final Product product = await UserService().fetchProductByID(productId);

      if (product != null) {
        // Create the CartModel with the associated product
        final cartItem = CartModel(product: product, quantity: quantity);
        cartItems.add(cartItem);
      }
    }
    return cartItems;
  }

  Future<void> updateCartQuantity(int productId, int newQuantity) async {
    final db = await database;

    await db.update(
      'carts',
      {'quantity': newQuantity},
      where: 'product_id = ?',
      whereArgs: [productId],
    );
  }

  Future<void> deleteCartItem(int productId) async {
    final db = await database;

    await db.delete(
      'carts',
      where: 'product_id = ?',
      whereArgs: [productId],
    );
  }

  Future<void> clearCart() async {
    final db = await database;

    await db.delete('carts');
  }
}
