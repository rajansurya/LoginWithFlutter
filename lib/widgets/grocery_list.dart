import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitledtest/data/categories.dart';

import '../data/dummy_items.dart';

class GroceryList extends StatelessWidget{
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grocery'),),
      body: ListView.builder(itemBuilder: (ctx,index)=>
      ListTile(
        title: Text(groceryItems[index].name,style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: Theme.of(context).primaryColor
        ),),
        leading: Container(color:categories[index]?.color),
        trailing: Text(groceryItems[index].quantity.toString()),
      )) ,
    );
  }

}