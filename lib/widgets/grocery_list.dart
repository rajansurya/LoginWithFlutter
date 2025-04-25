import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitledtest/data/categories.dart';
import 'package:untitledtest/widgets/new_item.dart';

import '../data/dummy_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _addItem() {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>NewItem()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery List'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (ctx, index) => ListTile(
                title: Text(
                  groceryItems[index].name,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.amber /*Theme.of(context).primaryColor*/
                      ),
                ),
                leading: Container(
                    width: 20,
                    height: 20,
                    color: groceryItems[index].category.color),
                trailing: Text(groceryItems[index].quantity.toString()),
              )),
    );
  }
}
