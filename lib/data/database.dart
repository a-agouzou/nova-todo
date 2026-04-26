import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  final _taskBox = Hive.box('tasksBox');

  // create initial data
  void createInitialData() {
    toDoList = [
      ['Buy groceries', false],
      ['Walk the dog', false],
    ];
  }

  // load data from database
  void loadData() {
    toDoList = _taskBox.get('TODOLIST');
  }

  // update database
  void updateData() {
    _taskBox.put('TODOLIST', toDoList);
  }
}
