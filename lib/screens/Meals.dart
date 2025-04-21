import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitledtest/models/meal.dart';
import 'package:untitledtest/screens/MealDetail.dart';

import '../widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  final String title;
  final List<Meal> meal;

  MealsScreen(
      {super.key,
      required this.title,
      required this.meal,
      /*required this.onFavSelected*/});

  // void Function(Meal) onFavSelected;

  void selectMeal(Meal meal, BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealDetail(
              meal: meal,

            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (meal.isEmpty) {
      content = const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(' Nothing meal'),
            SizedBox(
              height: 20,
            ),
            Text(
              ' Try other category',
            ),
          ],
        ),
      );
    } else {
      content = ListView.builder(
          itemCount: meal.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              meal: meal[index],
              onSelectMeal: (meal) {
                selectMeal(meal, context);
              },
            );
          });
      print(" ======  $meal");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
