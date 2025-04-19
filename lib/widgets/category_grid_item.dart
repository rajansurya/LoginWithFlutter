

import 'package:flutter/material.dart';

import '../models/CategoriesData.dart';

class CategoryGridItem extends StatelessWidget{
  final Category category;

  const CategoryGridItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors:[category.color.withOpacity(.55),category.color.withOpacity(.90)] )

      ),
      child: Text(category.title,),

    );
  }
  
}