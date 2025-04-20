import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitledtest/screens/CateroriesScreen.dart';
import 'package:untitledtest/screens/Meals.dart';

import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabScreen> {
  int selectedTab = 0;
final List<Meal> _favMeal=[];
  void selectPage(int index) {
    setState(() {
      selectedTab = index;
    });
  }

void _toggleMealFav(Meal meal){
    final isExist=_favMeal.contains(meal);
    if(isExist){
      _favMeal.remove(meal);
    }else {
      _favMeal.add(meal);
    }
}
  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onFavSelected: (meal){
      _toggleMealFav(meal);
    },);
    if (selectedTab == 1) {
      activePage = MealsScreen(title: "Fabv", meal: _favMeal,onFavSelected: (meal){
        _toggleMealFav(meal);
      },);
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
    );
  }
}
