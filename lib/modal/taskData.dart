import 'package:flutter/material.dart';

import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasksList = [
    Task(taskName: 'Task 1', taskDescription: 'This is a description'),
    Task(taskName: 'Task 2', taskDescription: 'This is a description'),
  ];

  void addTask({String taskName, String taskDescription}) {
    tasksList.add(
      Task(
        taskName: taskName,
        taskDescription: taskDescription,
      ),
    );
    notifyListeners();
  }
}
