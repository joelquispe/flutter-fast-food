import 'package:ecommercesmall/src/core/models/product.model.dart';

class CartItem {
  Product item;
  int quantity;
  CartItem({required this.item, required this.quantity});

  Map<String, dynamic> toMap() {
    return {
      'item': item.toMap(),
      'quantity': quantity,
    };
  }

  factory CartItem.fromMap(Map<dynamic, dynamic> map) {
    return CartItem(
      item:  Product.fromMap(map['item']),
      quantity: map['quantity'],
    );
  }
}
