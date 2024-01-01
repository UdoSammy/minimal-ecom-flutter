// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work/components/my_drawer.dart';
import 'package:work/components/my_product_tile.dart';
import 'package:work/models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    // access product in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
        appBar: AppBar(
          title: Text('Shop Page'),
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/cart_page');
                },
                icon: Icon(Icons.shopping_cart))
          ],
        ),
        drawer: MyDrawer(),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView(
          children: [
            Center(
              child: Text(
                'Pick from selected list of premium products',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
            SizedBox(
              height: 550,
              child: ListView.builder(
                  padding: EdgeInsets.all(15),
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    //get each individual product from shop
                    final product = products[index];

                    // return a product tile ui
                    return MyProductTile(product: product);
                  }),
            ),
          ],
        ));
  }
}
