import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitledtest/data/categories.dart';
import 'package:untitledtest/models/GroceryItem.dart';
import 'package:untitledtest/widgets/new_item.dart';

import '../data/dummy_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];

  void _addItem() async {
    final result = await Navigator.of(context)
        .push<GroceryItem>(MaterialPageRoute(builder: (ctx) => NewItem()));
    setState(() {
      _groceryItems.add(result!);
    });
  }
  void _removeItem(int item){
    setState(() {
      _groceryItems.removeAt(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content=const Center(child: Text('No item found'),);
    if(_groceryItems.isNotEmpty){
      content=ListView.builder(

          itemCount: _groceryItems.length,
          itemBuilder: (ctx, index) => Dismissible(
            direction: DismissDirection.endToStart,
            onDismissed: (direction){
                _removeItem(index);

            },
            key: ValueKey(_groceryItems[index].id),
            child: ListTile(
              title: Text(
                _groceryItems[index].name,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.amber /*Theme.of(context).primaryColor*/
                ),
              ),
              leading: Container(
                  width: 20,
                  height: 20,
                  color: _groceryItems[index].category.color),
              trailing: Text(_groceryItems[index].quantity.toString()),
            ),
          ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery List'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
