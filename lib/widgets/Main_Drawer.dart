import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget{
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String screen) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber,
      child: Column(
        children: [
          DrawerHeader(decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).cardColor
            ])
          ),child: Row(
            children: [
              Icon(Icons.add),
              Text('Cooking up',style: TextStyle(color: Theme.of(context).cardColor),),

            ],
          )),
          Column(
            children: [
              ListTile(
                onTap:() {
                  onSelectScreen("filter");
                },
                leading: Icon(Icons.add),
                title: Text('Filters',style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary
                ),),
              ),
              ListTile(
                onTap:() {
                  onSelectScreen("add");
                },
                leading: Icon(Icons.add),
                title: Text('fav',style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary
                ),),
              )
            ],
          )
        ],
      ),
    );
  }
  
}