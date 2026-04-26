import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart' show Hive, HiveX;
import 'package:todoapp/screens/todo_screen.dart';

void main() async {
  // Initialize Hive before running the app
  await Hive.initFlutter();

  // Open a Hive box to store tasks
  await Hive.openBox('tasksBox');

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ToDoScreen(),
    );
  }
}
