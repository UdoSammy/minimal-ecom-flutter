import 'package:flutter/material.dart';
import 'package:work/models/products.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    Product(
      category: 'watch',
      name: 'Product 1',
      price: 99.99,
      description: 'Item description',
      imagePath: 'assets/watch-1.png',
    ),
     Product(
      category: 'watch',
      name: 'Product 2',
      price: 99.99,
      description: 'Item description',
      imagePath: 'assets/watch-2.png',
    ),
     Product(
      name: 'Product 3',
      price: 99.99,
      description: 'Item description',
      imagePath: 'assets/watch-1.png',
      category: 'watch',
    ),
     Product(
      name: 'Product 4',
      price: 99.99,
      description: 'Item description',
      imagePath: 'assets/watch-2.png',
      category: 'watch',
    ),
     Product(
      name: 'Product 5',
      price: 99.99,
      description: 'Item description',
      imagePath: 'assets/shoe-1.png',
      category: 'shoe',
    )


  ];

  //user cart

  List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
