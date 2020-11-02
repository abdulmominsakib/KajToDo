import 'dart:ffi';

import 'package:flutter/material.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasksList = [
    Task(
      taskName: 'This is a Task',
      taskDescription: 'This is a task Description',
    ),
    Task(
      taskName: 'This is a Task',
      taskDescription: 'This is a task Description',
    ),
    Task(
      taskName: 'This is a Task',
      taskDescription: 'This is a task Description',
    ),
    Task(
      taskName: 'This is a Task',
      taskDescription: 'This is a task Description',
    ),
  ];

  List<Task> get tasksList => _tasksList;

  // Completed Task

  List<Task> completedTask = [];

  //  <--- Function of the Class --->
  void addTask({String taskName, String taskDescription}) {
    _tasksList.add(
      Task(
        taskName: taskName,
        taskDescription: taskDescription,
      ),
    );
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasksList.remove(task);
    notifyListeners();
  }
}
