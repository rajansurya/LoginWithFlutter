import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitledtest/providers/favorites_provider.dart';
import 'package:untitledtest/providers/meals_provider.dart';
import 'package:untitledtest/screens/CateroriesScreen.dart';
import 'package:untitledtest/screens/FiltersScreen.dart';
import 'package:untitledtest/screens/Meals.dart';
import 'package:untitledtest/widgets/Main_Drawer.dart';

import '../models/meal.dart';
import '../providers/filters_provider.dart';


const kInitialFilters={
  Filters.glutenFree:false,
  Filters.lactoseFree:false,
  Filters.vegetarian:false,
  Filters.vegan:false
};
class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabScreen> {
  int selectedTab = 0;
  // final List<Meal> _favMeal = [];

  void _setScreen(String indentfier) async {
    if (indentfier == "filter") {
      Navigator.of(context).pop();
      final result = await Navigator.of(context).push<Map<Filters, bool>>(
          MaterialPageRoute(builder: (ctx) => FiltersScreen()));
      print('=============== $result');
    } else {
      Navigator.of(context).pop();
    }
  }

  void selectPage(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  /*void _toggleMealFav(Meal meal) {
    final isExist = _favMeal.contains(meal);
    if (isExist) {
      setState(() {
        _favMeal.remove(meal);
      });
    } else {
      setState(() {
        _favMeal.add(meal);
      });
    }
  }*/


  @override
  Widget build(BuildContext context) {
  final meals= ref.watch(mealsProvider);
  final availableMeals=meals.where((meal){
     return true;
  });
    Widget activePage = CategoriesScreen();
    if (selectedTab == 1) {
      final favoritesMeals= ref.watch(favoritesMealProvider);

      activePage = MealsScreen(
        title: "Fabv",
        meal: favoritesMeals,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('dynamic...'),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.abc_sharp), label: "Fab")
        ],
        onTap: (index) {
          selectPage(index);
        },
      ),
      drawer: MainDrawer(
        onSelectScreen: (screen) {
          _setScreen(screen);
        },
      ),
    );
  }
}
