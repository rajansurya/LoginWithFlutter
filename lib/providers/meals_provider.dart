import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitledtest/data/dummy_data.dart';


final mealsProvider = Provider((_createFn) {
  return dummyMeals;
});
