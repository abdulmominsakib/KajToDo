import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
// <---  Main Task List Database Function --->
  static dataBaseInitialize() {
    Box<Task> taskBox = Hive.box<Task>('TaskList');
    return taskBox;
  }

  Box taskBox = dataBaseInitialize();

  // This function is also used to refresh the State or UI
  addToList() {
    tasksList = taskBox.values.toList();
  }

  removeFromList(index) {
    taskBox.deleteAt(index);
  }

// <--- End Main Task Screen Databases Functions--->

// <------->

// <--- Start Completed Task Databases Functions --->

  static completeTaskList() {
    Box<Task> completedBox = Hive.box<Task>('Completed');
    return completedBox;
  }

  Box compledtedBox = completeTaskList();

  // This function is also used to refresh the State or UI
  addToCompletedList() {
    completedTask = compledtedBox.values.toList();
  }

  removeFromCompletedList(index) {
    compledtedBox.deleteAt(index);
  }

// <--- End Completed Task Databases Functions --->

// <------->

  // Default Screen Selected to TaskScreen
  bool homeIsTapped = true;

  List<Task> tasksList = [];

// <--- Start TaskList Task Functions --->
// CRUD Operations Functions

  // CREATE
  void addTask({String taskName, String taskDescription}) {
    taskBox.add(Task(taskName: taskName, taskDescription: taskDescription));
    // Refreshes UI
    addToList();
    // NOTIFY ALL THE LISTENERS
    notifyListeners();
  }

  // UPDATE
  void updateTask(
      {int taskNum, String updatedTaskName, String updatedDescription}) {
    taskBox.putAt(taskNum,
        Task(taskName: updatedTaskName, taskDescription: updatedDescription));
    /* TaskNum is coming from the LIST which selects and updates specific 
    SELECTED TASK from the database and UI,
    addToList() update the STATE
     */
    addToList();
    notifyListeners();
  }

  // DELETE
  void deleteTask(int index, Task task) {
    // First remove from the UI LIST
    tasksList.remove(task);
    // Then remove from the Database
    // IF it done oppposite then it will not work.
    // because it stays in the database.
    removeFromList(index);
    notifyListeners();
  }

  // DONE
  void doneTask(Task task, int index) {
    // First Add this to the Completed Screen
    completedTask.add(task);
    compledtedBox.add(task);
    // Then remove it from the TaskScreen
    tasksList.remove(task);
    removeFromList(index);
    notifyListeners();
  }

// <--- End TaskList Task Functions --->

// <-------->

// <--- Completed TaskList --->

  List<Task> completedTask = [];

  // <--- Start Completed Task Functions --->
  // DELETE FUNCTION
  void deleteCompletedTask(int index, Task task) {
    // Remove from the Screen
    completedTask.remove(task);
    // Remove from the database
    removeFromCompletedList(index);
    notifyListeners();
  }

  // ADD to the TaskList
  void notDoneTask(int index, Task task) {
    // Add to the TaskList
    tasksList.add(task);
    taskBox.add(task);
    // Remove from the completed TaskList
    completedTask.remove(task);
    removeFromCompletedList(index);
    notifyListeners();
  }
}
