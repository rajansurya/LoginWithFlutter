import 'dart:ui';

class Category{
  final String title;
  final Color color;

   Category( this.title,  this.color);
}

enum Categories{
  vegetables,fruit,meat,dairy,carbs,sweets,spices,convenience,hygiene,other
}