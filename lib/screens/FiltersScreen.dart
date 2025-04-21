import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitledtest/providers/filters_provider.dart';

class FiltersScreen extends StatefulWidget {
  FiltersScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FiltersScreen> {
  var glutenFree = false;
  var lactoseFree = false;
  var vegetarian = false;
  var vegan = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: PopScope(
        onPopInvokedWithResult: (didPop, result) async {
          Navigator.of(context).pop({
            Filters.glutenFree: glutenFree,
            Filters.lactoseFree: lactoseFree,
            Filters.vegetarian: vegetarian,
            Filters.vegan: vegan
          });
        },
        child: Column(
          children: [
            SwitchListTile(
              value: glutenFree,
              onChanged: (isChecked) {
                setState(() {
                  glutenFree = isChecked;
                });
              },
              title: Text('glutenFree free'),
            ),
            SwitchListTile(
              value: vegan,
              onChanged: (isChecked) {
                setState(() {
                  vegan = isChecked;
                });
              },
              title: Text('vegan'),
            ),
            SwitchListTile(
              value: vegetarian,
              onChanged: (isChecked) {
                setState(() {
                  vegetarian = isChecked;
                });
              },
              title: Text('vegetarian'),
            ),
            SwitchListTile(
              value: lactoseFree,
              onChanged: (isChecked) {
                setState(() {
                  lactoseFree = isChecked;
                });
              },
              title: Text('lactoseFree'),
            )
          ],
        ),
      ),
    );
  }
}
