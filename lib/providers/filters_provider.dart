import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitledtest/providers/meals_provider.dart';
import 'package:untitledtest/screens/FiltersScreen.dart';

final filterProvider= StateNotifierProvider<FilterProvider,Map<Filters,bool>>((ref){
   return FilterProvider();
});


enum Filters { glutenFree, lactoseFree, vegetarian,vegan }


class FilterProvider extends StateNotifier<Map<Filters,bool>>{
  FilterProvider():super({
    Filters.glutenFree:false,
    Filters.lactoseFree:false,
    Filters.vegetarian:false,
    Filters.vegan:false
  });

  void setFilters(Map<Filters,bool> chosenFilters ){
     state=chosenFilters;
  }
  void setFilter(Filters filter,bool isActive){
    state ={...state,filter:isActive};

  }
}


final filteredMealProvider=Provider((ref){
  final meals=ref.watch(mealsProvider);
  final activeFilters=ref.watch(filterProvider);
  return meals.where((meal){
    if(activeFilters[Filters.lactoseFree]! && !meal.isLactoseFree){
      return false;
    }
    if(activeFilters[Filters.vegetarian]! && !meal.isVegetarian){
      return false;
    }
    if(activeFilters[Filters.glutenFree]! && !meal.isGlutenFree){
      return false;
    }
    if(activeFilters[Filters.vegan]! && !meal.isVegan){
      return false;
    }
    return true;
  }).toList();
});