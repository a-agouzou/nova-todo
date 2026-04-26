import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoItem extends StatelessWidget {
  final String taskName;
  final bool isDone;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;

  const ToDoItem({
    super.key,
    required this.taskName,
    required this.isDone,
    required this.onChanged,
    required this.deleteTask,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      //top 4 bottom 4 left 8 right 8
      padding: const EdgeInsets.only(
        top: 8.0,
        bottom: 0.0,
        left: 8.0,
        right: 8.0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              backgroundColor: Colors.red.shade300,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(8.0),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                value: isDone,
                onChanged: onChanged,
                activeColor: Colors.deepPurple[400],
                checkColor: Colors.white,
                // checkbox border color
                side: BorderSide(color: Colors.grey[600]!, width: 2.0),
              ),
              Text(
                taskName,
                style: TextStyle(
                  color: Colors.white,
                  decoration: isDone ? TextDecoration.lineThrough : null,
                  decorationColor: Colors.deepPurpleAccent[100], // The color
                  decorationThickness: 2.0, // Make the line thicker and clearer
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
