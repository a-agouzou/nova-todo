import 'package:flutter/material.dart';

class AddTaskDialog extends StatelessWidget {
  final taskController;
  final Function()? onAdd;
  final Function()? onCancel;

  AddTaskDialog({
    super.key,
    required this.taskController,
    required this.onAdd,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: const Text(
        'Add New Task',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        width: 300,
        height: 60, // Fixed height specifically to fit the sleek text field
        child: TextField(
          controller: taskController,
          autofocus:
              true, // UX improvement: Brings up the keyboard automatically
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.deepPurple[400],
          decoration: InputDecoration(
            hintText: 'Enter task name...',
            hintStyle: TextStyle(color: Colors.grey[500]),
            filled: true,
            fillColor: Colors.grey[900], // Deep dark fill instead of an outline
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none, // Simple, borderless floating feel
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed:
              onCancel, // Added empty function to enable the button color
          style: TextButton.styleFrom(foregroundColor: Colors.grey[300]),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: onAdd, // Added empty function to enable the button color
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple[400],
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text('Add'),
        ),
      ],
    );
  }
}
