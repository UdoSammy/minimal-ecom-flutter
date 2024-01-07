// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:work/models/products.dart';
import 'package:work/models/shop.dart';

class MyProductTile extends StatelessWidget {
  final Product product;



 MyProductTile({super.key, required this.product});

  // add to cart button
  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Add this item to the cart?'),
        actions: [
          // cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),

          // yes button
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              // add to cart
              context.read<Shop>().addToCart(product);
            },
            child: Text('Yes'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 300,
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    padding: EdgeInsets.all(25),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(product.imagePath)
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  product.name,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product.description,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$' + product.price.toStringAsFixed(2),
                ),

                //add to cart button
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(12)),
                  child: IconButton(
                    onPressed: () => addToCart(context),
                    icon: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
