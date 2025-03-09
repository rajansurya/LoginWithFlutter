import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

DialogBox(BuildContext context, String msg) {
  return showDialog(
      context: context,
      builder: (BuildContext contex) => AlertDialog(
            icon: Icon(Icons.error),
            actionsAlignment: MainAxisAlignment.center,
            contentPadding: const EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text("There could be an error"),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.black,
                child: Text(
                  "Okay",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ));
}
