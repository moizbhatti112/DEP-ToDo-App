import 'package:flutter/material.dart';
import 'package:todo2/pages/Theme/colors.dart';
import 'package:todo2/util/mybutton.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({super.key, required this.controller,required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: tdwhite,
      content: SizedBox(
        height: 120,
        // color: tdblue,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Mybutton(
                  text: 'Save',
                  onPressed: onSave,
                ),
                const SizedBox(
                  width: 10,
                ),
                Mybutton(text: 'Cancel', onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
