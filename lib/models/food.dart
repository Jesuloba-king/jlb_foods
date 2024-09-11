class Food {
  final String name; //cheese burger
  final String description; //a burger full of cheese
  final String imagePath; //assets/images...
  final double price; //$4.99
  final FoodCategory category; //burger
  List<Addon> availableAddons; //[extra cheese, sauce]

  Food(
      {required this.name,
      required this.description,
      required this.category,
      required this.availableAddons,
      required this.imagePath,
      required this.price});
}

//food categories
enum FoodCategory {
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}

//food addons
class Addon {
  final String name;
  final double price;

  Addon({required this.name, required this.price});
}
