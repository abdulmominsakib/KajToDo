import 'dart:ffi';

import 'package:flutter/material.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasksList = [
    Task(
      taskName: 'This is a Task 1',
      taskDescription: 'This is a task Description',
    ),
    Task(
      taskName: 'This is a Task 2',
      taskDescription: 'This is a task Description',
    ),
    Task(
      taskName: 'This is a Task 3',
      taskDescription: 'This is a task Description',
    ),
    Task(
      taskName: 'This is a Task 4',
      taskDescription: 'This is a task Description',
    ),
    Task(
      taskName: 'This is a Task 5',
      taskDescription: 'This is a task Description',
    ),
    Task(
      taskName: 'This is a Task 6',
      taskDescription: 'This is a task Description',
    ),
    Task(
      taskName: 'This is a Task 7',
      taskDescription: 'This is a task Description',
    ),
    Task(
      taskName: 'This is a Task 8',
      taskDescription: 'This is a task Description',
    ),
    Task(
      taskName: 'This is a Task 9',
      taskDescription: 'This is a task Description',
    ),
    Task(
      taskName: 'This is a Task 10',
      taskDescription: 'This is a task Description',
    ),
    Task(
      taskName: 'This is a Task 11',
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
