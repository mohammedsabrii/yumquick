import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String name;
  final double price;
  final String imagePath;
  final String date;
  final String time;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.date,
    required this.time,
    this.quantity = 1,
  });
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [
    CartItem(
      id: '1',
      name: 'Strawberry Shake',
      price: 20.0,
      imagePath: 'assets/images/drawer cart item test .png',
      date: '29 jan',
      time: '15:00',
      quantity: 1,
    ),
    CartItem(
      id: '2',
      name: 'Vanilla Shake',
      price: 15.0,
      imagePath: 'assets/images/drawer cart item test .png',
      date: '29 jan',
      time: '15:00',
      quantity: 1,
    ),
  ];

  List<CartItem> get items => _items;

  int get itemCount => _items.length;

  double get subtotal =>
      _items.fold(0, (sum, item) => sum + item.price * item.quantity);

  double get taxAndFees => subtotal * 0.1;
  double get delivery => 3.0; // Fixed delivery fee
  double get total => subtotal + taxAndFees + delivery;

  void updateQuantity(String id, int newQuantity) {
    if (newQuantity >= 1) {
      final item = _items.firstWhere((item) => item.id == id);
      item.quantity = newQuantity;
      notifyListeners();
    }
  }

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}
