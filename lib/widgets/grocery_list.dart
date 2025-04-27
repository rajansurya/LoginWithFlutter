import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitledtest/data/categories.dart';
import 'package:untitledtest/models/GroceryItem.dart';
import 'package:untitledtest/widgets/new_item.dart';
import 'package:http/http.dart' as http;
import '../data/dummy_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  var _isLoading = true;

  void _loadData() async {
    final url = Uri.https(domain, 'shopping-list.json');

    final response = await http.get(url);
    try {
      final List<GroceryItem> _groceryItemsLoc = [];

      final Map<String, dynamic> responseData = json.decode(response.body);
      for (final item in responseData.entries) {
        final category = categories.entries
            .firstWhere((cat) => cat.value.title == item.value['category'])
            .value;

        final data = GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category);
        _groceryItemsLoc.add(data);
      }

      setState(() {
        _groceryItems = _groceryItemsLoc;
        _isLoading = false;
      });
    } catch (exception) {
      print("$exception");
    }
  }

  void _addItem() async {
    final result = await Navigator.of(context)
        .push<GroceryItem>(MaterialPageRoute(builder: (ctx) => NewItem()));
    if (result == null) {
      return;
    }
    setState(() {
      _groceryItems.add(result!);
    });
    /*_loadData();*/
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _removeItem(int item) {
    setState(() {
      _groceryItems.removeAt(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text('No item found'),
    );
    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
          itemCount: _groceryItems.length,
          itemBuilder: (ctx, index) => Dismissible(
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
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
