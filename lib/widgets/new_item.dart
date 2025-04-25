import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/categories.dart';

class NewItem extends StatefulWidget {
  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              maxLength: 50,
              decoration: const InputDecoration(label: Text('Name')),
              validator: (value) {
                return 'de';
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(label: Text('input data')),
                    initialValue: '1',
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: DropdownButtonFormField(items: [
                    for (final category in categories.entries)
                      DropdownMenuItem(
                          value: category.value,
                          child: Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                              ),
                              Text(category.value.title),
                            ],
                          )),
                  ], onChanged: (val) {}),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
