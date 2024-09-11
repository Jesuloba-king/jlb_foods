import 'package:flutter/material.dart';
import 'package:jlb_foods/components/my_current_location.dart';
import 'package:jlb_foods/components/my_description_box.dart';
import 'package:jlb_foods/components/my_sliver_appbar.dart';
import 'package:jlb_foods/components/my_tab_bar.dart';
import 'package:jlb_foods/models/food.dart';
import 'package:jlb_foods/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import '../components/my_food_tile.dart';
import 'food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //tab controller
  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
    super.initState();
  }

  //sort out a list of food items
  List<Food> _filterMenuByCategory(
      FoodCategory foodCategory, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == foodCategory).toList();
  }

  //return list of foods in given category
  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      //get category menu
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);

      return ListView.builder(
          itemCount: categoryMenu.length,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            //get individual food
            final food = categoryMenu[index];

            //return food tile UI
            return FoodTile(
              food: food,
              onTap: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                return FoodDetailPage(food: food);
              })),
            );
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                MySliverAppbar(
                  title: MyTabBar(
                    tabController: _tabController,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Divider(
                        indent: 25,
                        endIndent: 25,
                        color: Theme.of(context).colorScheme.surface,
                      ),

                      //my current location
                      MyCurrentLocation(),

                      //description box
                      const MyDescriptionBox(),
                    ],
                  ),
                ),
              ],
          body: Consumer<Restaurant>(
            builder: (context, restaurant, index) => TabBarView(
              controller: _tabController,
              children: getFoodInThisCategory(restaurant.menu),
            ),
          )),
    );
  }
}
