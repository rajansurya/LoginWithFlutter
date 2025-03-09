import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  final String taskName;

  final bool taskCompleted;

  final Function(bool?)? onChange;

  Tile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 14.0, right: 14, top: 14, bottom: 14),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChange,
              activeColor: Colors.green,
            ),
            Text(taskName,style: TextStyle(
              decoration: taskCompleted?TextDecoration.lineThrough:TextDecoration.underline
            ),)
          ],
        ),
      ),
    );
  }
}
