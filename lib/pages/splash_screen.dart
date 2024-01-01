// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:work/components/my_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Minimal shop',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Your number one chopping shop',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),

            const SizedBox(
              height: 25,
            ),
            MyButton(
              onTap: () {
                Navigator.pushNamed(context, '/shop_page');
              },
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
