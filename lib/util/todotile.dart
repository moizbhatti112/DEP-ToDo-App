import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo2/pages/Theme/colors.dart';

// ignore: must_be_immutable
class MyTile extends StatefulWidget {
  final String name;
  final bool isDone;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  MyTile({
    super.key,
    required this.name,
    required this.isDone,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  State<MyTile> createState() => _MyTileState();
}

class _MyTileState extends State<MyTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Slidable(
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            onPressed: widget.deleteFunction,
            icon: Icons.delete,
            backgroundColor: tdred,
          )
        ]),
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
              color: tdwhite, borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Checkbox(
                value: widget.isDone,
                onChanged: widget.onChanged,
                activeColor: tdblue,
              ),
              Text(
                widget.name,
                style: TextStyle(
                    decoration: widget.isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
