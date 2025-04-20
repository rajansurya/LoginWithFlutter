import 'package:flutter/material.dart';

import '../models/CategoriesData.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;

  const CategoryGridItem({super.key, required this.category, required this.selectedCat});
 final void Function(Category) selectedCat;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        selectedCat(category);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
          category.color.withOpacity(.55),
          category.color.withOpacity(.90)
        ], end: Alignment.bottomLeft, begin: Alignment.bottomRight)),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary
          ),
        ),
      ),
    );
  }
}
