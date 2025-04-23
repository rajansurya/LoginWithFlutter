import 'dart:ui';

class Category{
  final String id;
  final Color color;

   Category( this.id,  this.color);
}

enum Categories{
  vegetables,fruit,meat,dairy,carbs,sweets,spices,convenience,hygiene,other
}