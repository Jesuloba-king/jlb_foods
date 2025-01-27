import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    var myPrimaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.inversePrimary);
    var mySecondaryTextStyle =
        TextStyle(color: Theme.of(context).colorScheme.primary);
    return Container(
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
      decoration: BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).colorScheme.secondary)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //delivery fee
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("\$0.99", style: myPrimaryTextStyle),
              Text("Delivery fee", style: mySecondaryTextStyle),
            ],
          ),

          //delivery time
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("15-30 min", style: myPrimaryTextStyle),
              Text("Delivery time", style: mySecondaryTextStyle),

              //
            ],
          ),
        ],
      ),
    );
  }
}
