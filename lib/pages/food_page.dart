import 'package:flutter/material.dart';
import 'package:jlb_foods/components/my_buttons.dart';
import 'package:jlb_foods/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';

class FoodDetailPage extends StatefulWidget {
  FoodDetailPage({super.key, required this.food}) {
    //initialize
    for (Addon addon in food.availableAddons) {
      selectedAddOns[addon] = false;
    }
  }
  final Food food;
  final Map<Addon, bool> selectedAddOns = {};

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //scaffold
        Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SingleChildScrollView(
            child: Column(
              children: [
                //food image
                Image.asset(widget.food.imagePath),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //food name
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      //pricew
                      Text(
                        "\$${widget.food.price}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      //descriptions
                      Text(
                        widget.food.description,
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      //divider
                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      //addons
                      Text(
                        "Add-ons",
                        style: TextStyle(
                          // fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),

                      //addons
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).colorScheme.secondary),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: widget.food.availableAddons.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              Addon addon = widget.food.availableAddons[index];
                              return CheckboxListTile(
                                value: widget.selectedAddOns[addon],
                                onChanged: (bool? value) {
                                  setState(() {
                                    widget.selectedAddOns[addon] = value!;
                                  });
                                },
                                title: Text(addon.name),
                                subtitle: Text(
                                  "\$${addon.price}",
                                  style: TextStyle(
                                    // fontSize: 16,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),

                //button
                Padding(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 12, bottom: 12),
                  child: MyButton(
                      onTap: () =>
                          addToCart(widget.food, widget.selectedAddOns),
                      text: "Add to Cart"),
                ),

                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),

        //button
        SafeArea(
          child: Opacity(
            opacity: 0.7,
            child: Container(
                margin: const EdgeInsets.only(left: 25),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                child: IconButton(
                  alignment: Alignment.center,
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () => Navigator.pop(context),
                )),
          ),
        ),
      ],
    );
  }

  //method to add to cart

  addToCart(Food food, Map<Addon, bool> selectedAddOns) {
    //close page to go back to menu
    Navigator.pop(context);

//format the selected addons
    List<Addon> currentlySelectedAddons = [];

    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddOns[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    context.read<Restaurant>().addToCart(food, currentlySelectedAddons);
  }
}
