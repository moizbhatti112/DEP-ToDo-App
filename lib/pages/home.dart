import 'package:flutter/material.dart';
import 'package:todo2/pages/Theme/colors.dart';
import 'package:todo2/util/dialog_box.dart';
import 'package:todo2/util/todotile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  
  void savenewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.clear();
  }

  final _controller = TextEditingController();
  List todoList = [
    ['Play Football', false],
    ['Do Exercise', false]
  ];
  void checkboxChanged(int index, bool? value) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void createnewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: savenewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }
void deleteTask(int index)
{
   setState(() {
     todoList.removeAt(index);
   });
}
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: tdbg,
          appBar: AppBar(
              backgroundColor: tdred,
              centerTitle: true,
              title: const Text(
                'ToDo App',
                style: TextStyle(
                    color: tdwhite, fontSize: 22, fontWeight: FontWeight.w700),
              )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              createnewTask();
            },
            backgroundColor: tdblue,
            child: const Icon(
              Icons.add,
              color: tdwhite,
              size: 30,
            ),
          ),
          body: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                return MyTile(
                  name: todoList[index][0],
                  isDone: todoList[index][1],
                  onChanged: (value) => checkboxChanged(index, value),
                  deleteFunction: (context)=> deleteTask(index)
                );
              })),
    );
  }
}
