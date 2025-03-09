import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton(
      {super.key,
       this.color,
       this.size,
      this.fontWeight,
      required this.text});

  final color;
  final size;
  final fontWeight;
  final text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: color == null ? Colors.amber : Colors.amber,
            fontSize: 24),
    );
  }
}
