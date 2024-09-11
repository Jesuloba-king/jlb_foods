import 'package:flutter/material.dart';
import 'package:jlb_foods/components/my_buttons.dart';
import 'package:jlb_foods/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../components/my_cart_tile.dart';
import 'payment_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restuarant, child) {
      //cart
      final userCart = restuarant.cart;

      final totalPrice = restuarant.getTotalPrice();

      //scaffold
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          title: const Text('Cart'),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            //clear cart button
            IconButton(
                onPressed: () {
                  // restuarant.clearCart();
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                              "Are you sure you want to clear the cart?"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("Cancel"),
                            ),

                            //yes button
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                //clear
                                restuarant.clearCart();
                              },
                              child: const Text("Yes"),
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.delete))
          ],
        ),
        body: Column(
          children: [
            //list of cart
            Expanded(
              child: Column(
                children: [
                  userCart.isEmpty
                      ? Expanded(
                          child: Center(
                              child: Text(
                            "Cart is empty...",
                            style: TextStyle(
                                fontSize: 20,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontWeight: FontWeight.bold),
                          )),
                        )
                      : Expanded(
                          child: ListView.builder(
                              itemCount: userCart.length,
                              itemBuilder: (context, index) {
                                //get individual cart item
                                final cartItem = userCart[index];
                                return MyCartTile(
                                  cartItem: cartItem,
                                );

                                // ListTile(
                                //   title: Text(cartItem.food.name),
                                //   subtitle: Text(cartItem.food.price.toString()),
                                // );
                              }),
                        ),
                ],
              ),
            ),

            //pay button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: MyButton(
                text: "Go to Checkout \$$totalPrice", //$getTotalPrice
                onTap: () {
                  //navigate to payment page
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const PaymentPage();
                  }));
                },
              ),
            ),

            const SizedBox(
              height: 25,
            ),
          ],
        ),
      );
    });
  }
}
