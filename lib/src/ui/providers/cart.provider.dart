import 'package:ecommercesmall/src/core/models/cart.model.dart';
import 'package:ecommercesmall/src/core/models/cartItem.model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  Cart cart = Cart(items: []);

  bool addItem(CartItem item) {
    final findCartItem = cart.items.indexWhere((element) => element.item.idProduct == item.item.idProduct);
    if (findCartItem == -1) {
      cart.items.add(item);
      cart.amount = cart.items.length;
      calculateTotal();
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  removeItem(String id) {
    cart.items = cart.items.where((element) => element.item.idProduct != id).toList();
    cart.amount = cart.items.length;
    calculateTotal();
    notifyListeners();
  }

  incrementQuantity(CartItem cartItem) {
    cartItem.quantity++;
    calculateTotal();
    notifyListeners();
  }

  decrementQuantity(CartItem cartItem) {
    cartItem.quantity--;
    if (cartItem.quantity == 0) {
      removeItem(cartItem.item.idProduct);
    }
    calculateTotal();
    notifyListeners();
  }

  calculateTotal() {
    double total = 0;
    for (var element in cart.items) {
      total += element.quantity * element.item.price;
    }
    cart.total = total;
  }
}
