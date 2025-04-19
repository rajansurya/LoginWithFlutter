import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitledtest/widgets/category_grid_item.dart';

import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Catrories')),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
         // availableCategories.map((cat)=> CategoryGridItem(category: cat)).toList()

        for(final cat in availableCategories)
          CategoryGridItem(category: cat,)
        ],
      ),
    );
  }
}
