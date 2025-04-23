import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitledtest/models/meal.dart';
import 'package:untitledtest/providers/favorites_provider.dart';

class MealDetail extends ConsumerWidget{
  final Meal meal;

   MealDetail({super.key, required this.meal,});
 // void Function(Meal) onFavSelected;


  @override
  Widget build(BuildContext context,WidgetRef ref) {
 final favoriteMeal=ref.watch(favoritesMealProvider);
 final isFavorite=favoriteMeal.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [IconButton(onPressed: (){
       final isAddedFav=  ref.watch(favoritesMealProvider.notifier).toggleMealFavorites(meal);

         ScaffoldMessenger.of(context).clearSnackBars();
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(isAddedFav ? 'Meal added':'Meal removed')));
          
        }, icon: Icon(isFavorite ? Icons.star: Icons.star_border))],
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