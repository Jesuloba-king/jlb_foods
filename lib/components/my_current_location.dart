import 'package:flutter/material.dart';
import 'package:jlb_foods/models/restaurant.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
  MyCurrentLocation({super.key});
  final textController = TextEditingController();

  void openLocationSearchBox(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Your Location"),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(hintText: "Enter address..."),
        ),
        actions: [
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),

          //save button
          MaterialButton(
            onPressed: () {
              //update address
              String newAddress = textController.text;
              context.read<Restaurant>().updateDeliveryAdress(newAddress);
              Navigator.of(context).pop();
              textController.clear();
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Deliver Now",
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),

        //
        InkWell(
          onTap: () => openLocationSearchBox(context),
          child: Row(
            children: [
              //address

              Consumer<Restaurant>(builder: (context, restaurant, child) {
                return Text(
                  restaurant.deliveryAddress,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold),
                );
              }),

              //dropdown menu
              const Icon(Icons.keyboard_arrow_down_rounded)
            ],
          ),
        )
      ]),
    );
  }
}
