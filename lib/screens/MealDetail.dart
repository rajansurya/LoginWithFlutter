import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitledtest/models/meal.dart';

class MealDetail extends StatelessWidget{
  final Meal meal;

   MealDetail({super.key, required this.meal, required this.onFavSelected});
 void Function(Meal) onFavSelected;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [IconButton(onPressed: (){
          onFavSelected(meal);
        }, icon: Icon(Icons.favorite))],
      ),

      body: Column(
        children: [Image.network(meal.imageUrl,height: 300,width: double.infinity,),
        for(final ingradient in meal.ingredients)
          Text(ingradient,style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.amber),)
        ]

      ),
    );
  }
  
}