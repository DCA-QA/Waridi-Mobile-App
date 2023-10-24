import 'products.dart';

class CartModel {
  final Product product;
  final int quantity;

  const CartModel({
    required this.product,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'product_id': product.id,
      'quantity': quantity,
    };
  }
}
