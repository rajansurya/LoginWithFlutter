import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Filters { gluteFree, lactoseFree }

class FiltersScreen extends StatefulWidget {
  FiltersScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FiltersScreen> {
  var glutenFreeSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: PopScope(
        onPopInvokedWithResult: (didPop, result) async{
          Navigator.of(context).pop({Filters.gluteFree: glutenFreeSet});
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenFreeSet,
              onChanged: (isChecked) {
                setState(() {
                  glutenFreeSet = isChecked;
                });
              },
              title: Text(' "Gluten free"'),
            ),
          ],
        ),
      ),
    );
  }
}
