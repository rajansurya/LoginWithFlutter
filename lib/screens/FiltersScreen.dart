import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitledtest/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  FiltersScreen(/*this.currentFilters,*/ {super.key});

  // final Map<Filters, bool> currentFilters;

/*  @override
  ConsumerState<FiltersScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends ConsumerState<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;*/

  /*@override
  void initState() {
    super.initState();
    final activeFilters=ref.read(filterProvider);
    _glutenFree = activeFilters[Filters.glutenFree]!;
    _lactoseFree = activeFilters[Filters.lactoseFree]!;
    _vegetarian = activeFilters[Filters.vegetarian]!;
    _vegan = activeFilters[Filters.vegan]!;
  }*/

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: /*PopScope(
        onPopInvokedWithResult: (didPop, result) async {

          ref.read(filterProvider.notifier).setFilters({
            Filters.glutenFree: _glutenFree,
            Filters.lactoseFree: _lactoseFree,
            Filters.vegetarian: _vegetarian,
            Filters.vegan: _vegan
          });

          */ /*Navigator.of(context).pop({
            Filters.glutenFree: _glutenFree,
            Filters.lactoseFree: _lactoseFree,
            Filters.vegetarian: _vegetarian,
            Filters.vegan: _vegan
          });*/ /*
        },
        child: */
          Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filters.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filters.glutenFree, isChecked);
            },
            title: Text('glutenFree free'),
          ),
          SwitchListTile(
            value: activeFilters[Filters.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filters.vegan, isChecked);
            },
            title: Text('vegan'),
          ),
          SwitchListTile(
            value: activeFilters[Filters.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filters.vegetarian, isChecked);
            },
            title: Text('vegetarian'),
          ),
          SwitchListTile(
            value: activeFilters[Filters.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filters.lactoseFree, isChecked);
            },
            title: Text('lactoseFree'),
          )
        ],
      ),
    );
  }
}
