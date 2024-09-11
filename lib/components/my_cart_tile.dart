import 'package:flutter/material.dart';
import 'package:jlb_foods/components/my_quantity_selector.dart';
import 'package:jlb_foods/models/cart_item.dart';
import 'package:jlb_foods/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  const MyCartTile({super.key, required this.cartItem});
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //food iamge
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        cartItem.food.imagePath,
                        height: 100,
                        width: 100,
                      ),
                    ),

                    //
                    const SizedBox(
                      width: 10,
                    ),

                    //name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.food.name,
                          // style: const TextStyle(
                          //   // color: Theme.of(context).colorScheme.primary,
                          //   fontWeight: FontWeight.bold,
                          // ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "\$${cartItem.food.price}",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        //increment of direction
                        MyQuantitySelector(
                            food: cartItem.food,
                            quantity: cartItem.quantity,
                            onIncrement: () {
                              restaurant.addToCart(
                                  cartItem.food, cartItem.selectedAddOns);
                            },
                            onDecrement: () {
                              restaurant.removeFromCart(cartItem);
                            }),
                      ],
                    ),

                    // const Spacer(),
                  ],
                ),
              ),

              //addons
              SizedBox(
                height: cartItem.selectedAddOns.isEmpty ? 0 : 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding:
                      const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                  children: cartItem.selectedAddOns
                      .map(
                        (addon) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterChip(
                            label: Row(
                              children: [
                                //addon name
                                Text(addon.name),

                                //price
                                Text(
                                  "\$${addon.price}",
                                ),
                              ],
                            ),
                            shape: StadiumBorder(
                                side: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            )),
                            onSelected: (value) {},
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            // labelPadding: const EdgeInsets.all(2),
                            labelStyle: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
