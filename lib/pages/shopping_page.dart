// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work/components/my_drawer.dart';
import 'package:work/components/my_product_tile.dart';
import 'package:work/models/shop.dart';

class ShopPage extends StatefulWidget {
  ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final List<String> categories = ['watch', 'shoe'];

  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {


    // access product in shop
    final products = context.watch<Shop>().shop;

    final filtered = products.where((product) {
      return selectedCategories.isEmpty || selectedCategories.contains(product.category);
    }).toList();

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
            // category
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: categories
                    .map(
                      (category) => FilterChip(
                        label: Text(category),
                        selected: selectedCategories.contains(category),
                        onSelected: (selected) {
                          setState(() {
                            if(selected) {
                            // add to the selected categories
                            selectedCategories.add(category);


                          }else{
                            selectedCategories.remove(category);
                          }
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(
              height: 550,
              child: ListView.builder(
                  padding: EdgeInsets.all(15),
                  // scrollDirection: Axis.horizontal,
                  // itemCount: products.length,
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    //get each individual product from shop
                    final product = filtered[index];

                    // return a product tile ui
                    return MyProductTile(product: product);
                  }),
            ),
          ],
        ));
  }
}
