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
  //var _isLoading = true;
  // String? _error = null;
late Future<List<GroceryItem>> _loadedItems;
  Future<List<GroceryItem>> _loadData() async {
    final url = Uri.https(domain, 'shopping-list.json');
    try {
      final response = await http.get(url);
      final List<GroceryItem> _groceryItemsLoc = [];
      if (response.statusCode >= 400) {
       /* setState(() {
          _error = 'Failed to load data, try after some time!';
        });*/
        throw Exception('Something went wrong, please try after some time');
      }
      if(response.body == 'null'){
        /*setState(() {
          _isLoading=false;
        });*/
        return[];
      }
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

     /* setState(() {
        _groceryItems = _groceryItemsLoc;
        _isLoading = false;
      });*/
      return _groceryItemsLoc;
    } catch (exception) {
      throw Exception('Something went wrong, please try after some time');
     /* setState(() {
        _error = 'Some thing went wrong, try after some time!';
      });*/
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
    _loadedItems= _loadData();
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    setState(() {
      _groceryItems.remove(item);
    });
    final url = Uri.https(domain, 'shopping-list/${item.id}.json');

    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
  //  Widget content =
   /* if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    }*/

   /* if (_error != null) {
      content = Center(
        child: Text(_error!),
      );
    }*/
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery List'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: FutureBuilder(future: _loadedItems, builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
         return Center(child: const CircularProgressIndicator());
        }
        if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }
        if(snapshot.data!.isEmpty){
return const Center(
  child: Text('No item found'),
);
        }
        return
          ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (ctx, index) => Dismissible(
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  _removeItem(snapshot.data![index]);
                },
                key: ValueKey(snapshot.data![index].id),
                child: ListTile(
                  title: Text(
                    snapshot.data![index].name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.amber /*Theme.of(context).primaryColor*/
                    ),
                  ),
                  leading: Container(
                      width: 20,
                      height: 20,
                      color: snapshot.data![index].category.color),
                  trailing: Text(snapshot.data![index].quantity.toString()),
                ),
              ));

      }),
    );
  }
}
