import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;
  final String description;
  final String imagePath;
  final String category;

  Product(
      {required this.name,
      required this.price,
      required this.description,
      required this.imagePath, required this.category});
}
