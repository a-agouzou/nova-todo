import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/components/todo_item.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/screens/add_task_dialog.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  final _taskBox = Hive.box('tasksBox');

  ToDoDatabase db = ToDoDatabase();

  //initState
  @override
  void initState() {
    // TODO: implement initState

    if (_taskBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final TextEditingController _taskController = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = value;
    });
    db.updateData();
  }

  void addNewTaskList() {
    setState(() {
      db.toDoList.add([_taskController.text, false]);
    });
    Navigator.of(context).pop();
    _taskController.clear();
    db.updateData();
  }

  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AddTaskDialog(
          taskController: _taskController,
          onAdd: addNewTaskList,
          onCancel: () {
            Navigator.of(context).pop();
            _taskController.clear();
          },
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          'N O V A    T O D O',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 4,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        backgroundColor: Colors.deepPurple[400],
        foregroundColor: Colors.white,
        elevation: 4,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoItem(
            taskName: db.toDoList[index][0],
            isDone: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
