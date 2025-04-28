import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitledtest/models/Category.dart';
import 'package:untitledtest/models/GroceryItem.dart';
import 'package:http/http.dart' as http;
import '../data/categories.dart';
import 'package:http/http.dart';

class NewItem extends StatefulWidget {
  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}
const domain='myfirst-5ad65-default-rtdb.firebaseio.com';

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  var _enterName = '';
  var _quantity = 1;
  var _selectedCategory = categories[Categories.dairy];
var _isSending=false;

  void saveForm() async{
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isSending=true;
      });
      print(_enterName);
      print(_quantity);
      print(_selectedCategory);
      final url = Uri.https(domain, 'shopping-list.json');

    final response= await http.post(url,
          headers: {'Content-type': 'application/json'},
          body: json.encode({
            'name': _enterName,
            'quantity': _quantity,
            'category': _selectedCategory?.title
          }));

    print('===${response.body}');
    print('===${response.statusCode}');

    if(!context.mounted){
      return ;    //Navigator.of(context).pop();
    }
    final Map<String,dynamic> resData=json.decode(response.body);
      Navigator.of(context).pop(GroceryItem(
          id: resData['name'],
          name: _enterName,
          quantity: _quantity,
          category: _selectedCategory!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  decoration: const InputDecoration(label: Text('Name')),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'Please enter character between 1 to 50';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enterName = value!;
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(label: Text('input data')),
                        initialValue: '1',
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null ||
                              int.tryParse(value)! < 0) {
                            return 'Must be valid positive number';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _quantity = int.parse(value!);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: DropdownButtonFormField(
                          value: _selectedCategory,
                          items: [
                            for (final category in categories.entries)
                              DropdownMenuItem(
                                  value: category.value,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 10,
                                        height: 10,
                                        color: category.value.color,
                                      ),
                                      Text(category.value.title),
                                    ],
                                  )),
                          ],
                          onChanged: (val) {
                            setState(() {
                              _selectedCategory = val;
                            });
                          }),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: _isSending ?null:() {
                          _formKey.currentState?.reset();
                        },
                        child: const Text('Reset')),
                    ElevatedButton(
                        onPressed:_isSending?null: saveForm, child:_isSending?const SizedBox(height: 16,width: 16,child: CircularProgressIndicator(),): const Text('Add Item'))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
