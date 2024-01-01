// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work/models/shop.dart';
import 'package:work/pages/cart_page.dart';
import 'package:work/pages/shopping_page.dart';
import 'package:work/pages/splash_screen.dart';
import 'package:work/themes/light_mode.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => const SplashScreen(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
