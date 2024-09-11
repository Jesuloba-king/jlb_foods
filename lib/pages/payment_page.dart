import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:jlb_foods/components/my_buttons.dart';

import 'deliverypage.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('Checkout'),
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          //credit card
          CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              onCreditCardWidgetChange: (p0) {}),

          //credit card form
          CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: (date) {
                setState(() {
                  cardNumber = date.cardNumber;
                  expiryDate = date.expiryDate;
                  cardHolderName = date.cardHolderName;
                  cvvCode = date.cvvCode;
                });
              },
              formKey: _formKey),

          const Spacer(),

          //pay button
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: MyButton(
              text: "Pay now",
              onTap: userTapped,
            ),
          ),

          const SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  void userTapped() {
    if (_formKey.currentState!.validate()) {
      //only show dialog if form is valid
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Confirm Payment'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text("Card Number: $cardNumber"),
                    Text("Expiry Date: $expiryDate"),
                    Text("Card Holder Name: $cardHolderName"),
                    Text("CVV: $cvvCode"),
                  ],
                ),
              ),
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
                    // restuarant.clearCart();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const DeliveryProgressPage();
                    }));
                  },
                  child: const Text("Yes"),
                ),
              ],
            );
          });
    }
  }
}
