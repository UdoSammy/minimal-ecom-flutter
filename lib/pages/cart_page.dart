// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:work/components/my_button.dart';
import 'package:work/components/my_drawer.dart';
import 'package:work/models/products.dart';
import 'package:work/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

// remove item from cart
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Remove this item from cart?'),
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
              context.read<Shop>().removeFromCart(product);
            },
            child: Text('Yes'),
          )
        ],
      ),
    );
  }

  //pay function

  void payButtonPress(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(
                  'User wants to pay! connect this app to you payment backend'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    // get access to cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // cart list
          Expanded(
            child: cart.isEmpty
                ? Center(
                    child: Text('Your cart is empty...',),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //get individual item in cart
                      final item = cart[index];

                      // return cart tile ui
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(
                          item.price.toStringAsFixed(2),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () => removeItemFromCart(context, item),
                        ),
                      );
                    }),
          ),

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(
              onTap: () => payButtonPress(context),
              child: Text('Pay now'),
            ),
          ),
        ],
      ),
    );
  }
}
