import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  void setFilter(Filters filter,bool isActive){
    state ={...state,filter:isActive};

  }
}