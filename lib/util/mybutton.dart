import 'package:flutter/material.dart';
import 'package:todo2/pages/Theme/colors.dart';

class Mybutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
   const Mybutton({super.key  ,required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: tdred,
      child: Text(text,style: const TextStyle(color: tdwhite),),
    );
  }
}
