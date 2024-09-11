import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'cart_item.dart';
import 'food.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    //burgers
    Food(
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
        Addon(name: "Avocado", price: 2.99),
      ],
      name: 'Classic Cheeseburger',
      description:
          'A juicy beef patty with melted cheddar, lettuce, tomato, and a hint of onion and pickle.',
      category: FoodCategory.burgers,
      imagePath: 'assets/burgers/cheese_burger.jpeg',
      price: 8.99,
    ),
    //
    Food(
      availableAddons: [
        Addon(name: "Vegan Cheese", price: 0.99),
        Addon(name: "Grilled Mushrooms", price: 1.99),
        Addon(name: "Humus Spread", price: 2.99),
      ],
      name: 'Veggie Burger',
      description:
          'A hearty veggie patty topped with fresh avocado, lettuce and tomato, served on a whole',
      category: FoodCategory.burgers,
      imagePath: 'assets/burgers/vege_burger.jpeg',
      price: 9.49,
    ),
    //
    Food(
      name: 'BBQ Bacon Burger',
      description:
          'Smoky BBQ Sauce, crispy bacon, and onion rings make this beef berger a savory delight.',
      category: FoodCategory.burgers,
      imagePath: 'assets/burgers/bbq_burger.jpeg',
      price: 10.99,
      availableAddons: [
        Addon(name: "Grilled Onions", price: 0.99),
        Addon(name: "Jalapeños", price: 1.49),
        Addon(name: "Extra BBQ Sauce", price: 1.99),
      ],
    ),

    //
    Food(
      name: 'Aloha Burger',
      description:
          'A char-grilled chicken breast tooped with a slice of grilled pineapple, Swiss cheese and onions',
      category: FoodCategory.burgers,
      imagePath: 'assets/burgers/aloha_burger.jpeg',
      price: 9.49,
      availableAddons: [
        Addon(name: "Teriyaki Glaze", price: 0.99),
        Addon(name: "Extra Pineapple", price: 1.99),
        Addon(name: "Bacon", price: 2.99),
      ],
    ),
    Food(
      name: 'Blue Moon Burger',
      description:
          'This burger is a blue cheese lover\'s dream. It features a succulent ground beef patty.',
      category: FoodCategory.burgers,
      imagePath: 'assets/burgers/bluemoon_burger.jpeg',
      price: 8.49,
      availableAddons: [
        Addon(name: "Sautéed Mushrooms", price: 0.99),
        Addon(name: "Fried Egg", price: 1.99),
        Addon(name: "Spicy Mayo", price: 0.29),
      ],
    ),

    //desserts
    Food(
      name: 'Chocolate Brownie',
      description:
          'Rich and fudgy chocolate brownie, with chunks of vegetables',
      category: FoodCategory.desserts,
      imagePath: 'assets/desserts/chocolate_brownie.jpeg',
      price: 5.99,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: 0.99),
        Addon(name: "Hot Fudge", price: 1.49),
        Addon(name: "Whipped Cream", price: 1.99),
      ],
    ),
    Food(
      name: 'Cheesecake',
      description:
          'Creamy cheesecake on a graham cracker crust, with a berry compote.',
      category: FoodCategory.desserts,
      imagePath: 'assets/desserts/cheesecake.jpeg',
      price: 6.99,
      availableAddons: [
        Addon(name: "Strawberry tooping", price: 0.99),
        Addon(name: "Blueberry Compote", price: 1.49),
        Addon(name: "Chocolate Chips", price: 1.99),
      ],
    ),
    Food(
      name: 'Apple Pie',
      description:
          'Clasky apple pie with a flaky crust and a cinnamon-spiced apple filling.',
      category: FoodCategory.desserts,
      imagePath: 'assets/desserts/apple_pie.jpeg',
      price: 5.49,
      availableAddons: [
        Addon(name: "Caramel Sauce", price: 0.99),
        Addon(name: "Vanilla Ice Cream", price: 1.49),
        Addon(name: "Cinnamon Spice Chips", price: 1.99),
      ],
    ),

    Food(
      name: 'Red Velvet Cake',
      description:
          'A delectable red velvet cake with a warm, gooey chocolate lava center, served with strawberries.',
      category: FoodCategory.desserts,
      imagePath: 'assets/desserts/red_velvet_cake.jpeg',
      price: 5.49,
      availableAddons: [
        Addon(name: "Raspberry Sauce", price: 0.99),
        Addon(name: "Cream Cheese Icing", price: 1.49),
        Addon(name: "Chocolate Sprinkles", price: 1.99),
      ],
    ),

    Food(
      name: 'Potato Pie Cake',
      description: 'A feshly baked Potato pie, sprinkled with savory spice',
      category: FoodCategory.desserts,
      imagePath: 'assets/desserts/potato_pie_cake.jpeg',
      price: 5.49,
      availableAddons: [
        Addon(name: "Whipped Cream", price: 0.99),
        Addon(name: "Cream Cheese Icing", price: 1.49),
        Addon(name: "Chocolate Sprinkles", price: 1.99),
      ],
    ),

    //salads
    Food(
      name: 'Ceaser Salad',
      description:
          'Crisp romaine lettuce, parmesan cheese, croutons and Caesar dressing',
      category: FoodCategory.salads,
      imagePath: 'assets/salads/caesar_salad.jpeg',
      price: 7.49,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 0.99),
        Addon(name: "Anchovies", price: 1.49),
        Addon(name: "Extra Permesan", price: 1.99),
      ],
    ),
    Food(
      name: 'Greek Salad',
      description:
          'Tomatoes, cucumbers, red onions, olives, feta cheese with olive oil and herbs',
      category: FoodCategory.salads,
      imagePath: 'assets/salads/greek_salad.jpeg',
      price: 8.49,
      availableAddons: [
        Addon(name: "Sautéed Mushrooms", price: 0.99),
        Addon(name: "Fried Egg", price: 1.99),
        Addon(name: "Spicy Mayo", price: 0.29),
      ],
    ),
    Food(
      name: 'Quinoa Salad',
      description:
          'Quinoa mixed wiht cucumbers, tomatoes, bell peppers and a lemon vinaigrette',
      category: FoodCategory.salads,
      imagePath: 'assets/salads/quinoa_salad.jpeg',
      price: 9.99,
      availableAddons: [
        Addon(name: "Avocado", price: 0.99),
        Addon(name: "Feta Cheese", price: 1.49),
        Addon(name: "Grilled Chicken", price: 1.99),
      ],
    ),

    Food(
      name: 'Asian Sesame Salad',
      description:
          'Delight in the flavors of the East with this seasme-infused salad. It includes mixed greetings.',
      category: FoodCategory.salads,
      imagePath: 'assets/salads/asiansesame_salad.jpeg',
      price: 8.49,
      availableAddons: [
        Addon(name: "Mandarin Oranges", price: 0.99),
        Addon(name: "Almond Slivers", price: 1.49),
        Addon(name: "Extra Teriyaki Chicken", price: 1.99),
      ],
    ),

    Food(
      name: 'South West Chicken Salad',
      description:
          'This colorful salad combines the zesty flavors of the southwest. It\'s loaded with mixed continents',
      category: FoodCategory.salads,
      imagePath: 'assets/salads/southwest_salad.jpeg',
      price: 9.99,
      availableAddons: [
        Addon(name: "Sour Cream", price: 0.99),
        Addon(name: "Pico de Gallo", price: 1.49),
        Addon(name: "Guacamole Mayo", price: 1.99),
      ],
    ),

    //sides
    Food(
      name: 'Sweet Potato Fries',
      description: 'Crispy sweet potato fries with a touch of salt.',
      category: FoodCategory.sides,
      imagePath: 'assets/sides/sweet_potato_side.jpeg',
      price: 4.99,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.99),
        Addon(name: "Truffle Oil", price: 1.49),
        Addon(name: "Cajun Spice", price: 1.99),
      ],
    ),

    //
    Food(
      name: 'Onion Rings',
      description: 'Golden and crispy onion rings, perfect for dipping.',
      category: FoodCategory.sides,
      imagePath: 'assets/sides/onion_rings_side.jpeg',
      price: 3.99,
      availableAddons: [
        Addon(name: "Ranch Dip Cream", price: 0.99),
        Addon(name: "Spicy Mayo", price: 1.49),
        Addon(name: "Permesan Dust", price: 1.99),
      ],
    ),

    Food(
      name: 'Garlic Bread',
      description:
          'Warm and toasty garlic bread, topped with melted butter and parsley.',
      category: FoodCategory.sides,
      imagePath: 'assets/sides/garlic_bread_side.jpeg',
      price: 4.99,
      availableAddons: [
        Addon(name: "Extra Garlic", price: 0.99),
        Addon(name: "Mozzarella Cheese", price: 1.49),
        Addon(name: "Marinara Dip", price: 1.99),
      ],
    ),

    Food(
      name: 'Loaded Sweet Potato Fries',
      description:
          'Savory sweet potato fries loaded with melted cheese, smoky bacon bits, and a dollop os spice',
      category: FoodCategory.sides,
      imagePath: 'assets/sides/loadedfries_side.jpeg',
      price: 4.99,
      availableAddons: [
        Addon(name: "Sour Cream", price: 0.99),
        Addon(name: "Bacon Bits", price: 1.49),
        Addon(name: "Green Onions", price: 0.99),
      ],
    ),

    Food(
      name: 'Crispy mac & Cheese Bites',
      description:
          'Golden brown, bite-sized mac and cheese balls, perfect for on-the-go snacking. Served with ...',
      category: FoodCategory.sides,
      imagePath: 'assets/sides/mac_side.jpeg',
      price: 4.99,
      availableAddons: [
        Addon(name: "Bacon Bits", price: 0.99),
        Addon(name: "Jalapeño Slices Bits", price: 1.49),
        Addon(name: "Sriracha Drizzle", price: 1.99),
      ],
    ),

    //////drinks
    Food(
      name: 'Lemonade',
      description:
          'Refreshing lemonade made with real lemons and a touch 0f sweetness',
      category: FoodCategory.drinks,
      imagePath: 'assets/drinks/lemonade.jpeg',
      price: 2.99,
      availableAddons: [
        Addon(name: "Strawberry Flavor", price: 0.99),
        Addon(name: "JalMint Leaves", price: 1.49),
        Addon(name: "Ginger Zest", price: 1.99),
      ],
    ),

    Food(
      name: 'Iced Tea',
      description: 'Chilled iced tea with a hint of lemon, served over ice.',
      category: FoodCategory.drinks,
      imagePath: 'assets/drinks/iced_tea.jpeg',
      price: 2.99,
      availableAddons: [
        Addon(name: "Peach Flavor", price: 0.99),
        Addon(name: "Lemon Slices", price: 1.49),
        Addon(name: "Honey", price: 1.99),
      ],
    ),

    Food(
      name: 'Smoothie',
      description:
          'A blend of fresh fruits and yogurt, perfect for a healthy boost.',
      category: FoodCategory.drinks,
      imagePath: 'assets/drinks/smoothie.jpeg',
      price: 4.99,
      availableAddons: [
        Addon(name: "Protein Powder", price: 0.99),
        Addon(name: "Almond Milk", price: 1.49),
        Addon(name: "Chia Seeds", price: 1.99),
      ],
    ),

    Food(
      name: 'Mojito',
      description:
          'A classic Cuban cocktail with meddled lime and mint, sweetened with sugar.',
      category: FoodCategory.drinks,
      imagePath: 'assets/drinks/mojito.jpeg',
      price: 4.99,
      availableAddons: [
        Addon(name: "Extra Mint", price: 0.99),
        Addon(name: "Raspberry Puree", price: 1.49),
        Addon(name: "Splash of Coconut Rum", price: 1.99),
      ],
    ),

    Food(
      name: 'Caramel Macchiato',
      description:
          'A lavered coffee drink with steamed milk, espresson and vanilla syrup.',
      category: FoodCategory.drinks,
      imagePath: 'assets/drinks/caramel_macchi.jpeg',
      price: 4.99,
      availableAddons: [
        Addon(name: "Extra Shot of Espresso", price: 0.99),
        Addon(name: "Hazelnut Syrup", price: 1.49),
        Addon(name: "Whipped Cream", price: 1.99),
      ],
    ),
  ];

  String _deliveryAddress = "99 Hollywood Blv";

  //GETTERS
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  ///OPERATIONS

  //update delivery address
  void updateDeliveryAdress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  //user cart
  final List<CartItem> _cart = [];
  //add to cart
  void addToCart(Food food, List<Addon> selectedAddOns) {
    //see if there is cart tiem with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;

      //check if the list of selected addons are the same
      bool isSelectedAddons =
          const ListEquality().equals(item.selectedAddOns, selectedAddOns);

      return isSelectedAddons && isSameFood;
    });

    //if cart itmes already exists, increase it's wuantity
    if (cartItem != null) {
      cartItem.quantity++;
    }

    //otherwise, add a new cart item to the cart
    else {
      _cart.add(CartItem(food: food, selectedAddOns: selectedAddOns));
    }
    notifyListeners();
  }

  //remove from cart

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != 1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice() {
    double total = 0.0;

    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;

      for (Addon addon in cartItem.selectedAddOns) {
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }

    return total;
  }

  //get total number of items in cart
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();

    notifyListeners();
  }

  /*
  HELPERS
  */
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt");
    receipt.writeln();

    //format the date to include up to seconds only
    String formattedDate =
        DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for (final cartItem in _cart) {
      receipt.writeln();
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");

      if (cartItem.selectedAddOns.isNotEmpty) {
        receipt.writeln("Add-ons: ${_formatAddons(cartItem.selectedAddOns)}");
      }
      receipt.writeln();
    }

    receipt.writeln("-----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    //
    return receipt.toString();
  }

  //GENERATE A RECEIPT
  //format double value into money/string
  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  //format list of addons into string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(',');
  }

  //delivery address
}
