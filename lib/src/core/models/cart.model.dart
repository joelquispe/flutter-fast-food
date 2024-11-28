import 'package:ecommercesmall/src/core/models/cartItem.model.dart';

class Cart {
  List<CartItem> items;
  int amount;
  double total;

  Cart({required this.items, this.amount = 0, this.total = 0});

  Map<String, dynamic> toMap() {
    return {
      'items': items.map((e) => e.toMap()).toList(),
      'amount': amount,
      'total': total,
    };
  }

  factory Cart.fromMap(Map<dynamic, dynamic> map) {
    return Cart(
      items: List<CartItem>.from(map['items'].map((e) => CartItem.fromMap(e))),
      amount: map['amount'],
      total: map['total'],
    );
  }
}
