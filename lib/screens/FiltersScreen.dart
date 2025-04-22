import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitledtest/providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  FiltersScreen(/*this.currentFilters,*/ {super.key});

  // final Map<Filters, bool> currentFilters;

  @override
  ConsumerState<FiltersScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  @override
  void initState() {
    super.initState();
    final activeFilters=ref.read(filterProvider);
    _glutenFree = activeFilters[Filters.glutenFree]!;
    _lactoseFree = activeFilters[Filters.lactoseFree]!;
    _vegetarian = activeFilters[Filters.vegetarian]!;
    _vegan = activeFilters[Filters.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: PopScope(
        onPopInvokedWithResult: (didPop, result) async {

          ref.read(filterProvider.notifier).setFilters({
            Filters.glutenFree: _glutenFree,
            Filters.lactoseFree: _lactoseFree,
            Filters.vegetarian: _vegetarian,
            Filters.vegan: _vegan
          });

          /*Navigator.of(context).pop({
            Filters.glutenFree: _glutenFree,
            Filters.lactoseFree: _lactoseFree,
            Filters.vegetarian: _vegetarian,
            Filters.vegan: _vegan
          });*/
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFree,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFree = isChecked;
                });
              },
              title: Text('glutenFree free'),
            ),
            SwitchListTile(
              value: _vegan,
              onChanged: (isChecked) {
                setState(() {
                  _vegan = isChecked;
                });
              },
              title: Text('vegan'),
            ),
            SwitchListTile(
              value: _vegetarian,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarian = isChecked;
                });
              },
              title: Text('vegetarian'),
            ),
            SwitchListTile(
              value: _lactoseFree,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFree = isChecked;
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
