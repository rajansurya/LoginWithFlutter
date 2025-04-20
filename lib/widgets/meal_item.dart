import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({super.key, required this.meal, required this.onSelectMeal});
 final void Function(Meal) onSelectMeal;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black54,
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
