import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitledtest/models/meal.dart';

final favoritesMealProvider = StateNotifierProvider<FavoritesMealNotifier,List<Meal>>((ref) {
  return FavoritesMealNotifier();
});

class FavoritesMealNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealNotifier() : super([]);

  bool toggleMealFavorites(Meal meal) {
    final isMealFavorites = state.contains(meal);
    if (isMealFavorites) {
      state = state.where((mealItem) => mealItem.id != meal.id).toList();
      return false;
    } else {
      state = [...state ,meal];
      return true;
    }
  }
}
