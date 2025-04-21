import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitledtest/screens/Meals.dart';
import 'package:untitledtest/widgets/category_grid_item.dart';
import 'package:untitledtest/models/CategoriesData.dart';
import '../data/dummy_data.dart';
import '../models/meal.dart';

class CategoriesScreen extends StatelessWidget {
   CategoriesScreen();
  // void Function(Meal) onFavSelected;
  void _selectCategory(BuildContext context, Category category) {
    final filterList = dummyMeals
        .where((item) => item.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return MealsScreen(
        title: category.title,
        meal: filterList,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Catrories')),
      body: GridView(
        padding: EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          // availableCategories.map((cat)=> CategoryGridItem(category: cat)).toList()

          for (final cat in availableCategories)
            CategoryGridItem(
              category: cat,
              selectedCat: (category) {
                _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
