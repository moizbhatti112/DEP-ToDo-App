import 'package:hive_flutter/hive_flutter.dart';

// ignore: camel_case_types
class todoDatabase {
  List todoList = [];
  // ignore: unused_field
  final _myBox = Hive.box('mybox');

  void createInitialData() {
    todoList = [
      ['Make Tutorial', false],
      ['do Exercise', false]
    ];
  }

  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  void updateDatabase() {
    _myBox.put("TODOLIST", todoList);
  }
}
