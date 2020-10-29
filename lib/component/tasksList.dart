import 'package:flutter/material.dart';
import 'package:kajtodo/modal/task.dart';
import 'package:kajtodo/styling/style.dart';

List<Task> tasksList = [
  Task(taskName: 'Task 1', taskDescription: 'This is a description'),
  Task(taskName: 'Task 2', taskDescription: 'This is a description'),
  Task(taskName: 'Task 3', taskDescription: 'This is a description'),
  Task(taskName: 'Task 4', taskDescription: 'This is a description'),
  Task(taskName: 'Task 5', taskDescription: 'This is a description'),
];

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return SingleTask(
              taskTitle: tasksList[index].taskName,
              taskDescription: tasksList[index].taskDescription,
              checkTask: null,
              editTask: null,
            );
          },
          itemCount: tasksList.length,
        ),
      ),
    );
  }
}

class SingleTask extends StatelessWidget {
  SingleTask(
      {this.taskTitle, this.taskDescription, this.checkTask, this.editTask});

  final String taskTitle;
  final String taskDescription;
  Function editTask;
  Function checkTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      height: 100,
      margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1.0, 6.0),
            blurRadius: 15.0,
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  taskTitle,
                  style: kTaskTitle,
                ),
                IconButton(
                    icon: Icon(
                      Icons.edit_location_outlined,
                      color: Color(0xFF6C63FF),
                    ),
                    onPressed: editTask),
              ],
            ),
            Container(
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    taskDescription,
                    style: kTaskDescription,
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.check_circle,
                        color: Color(0xFFAD83FE),
                      ),
                      onPressed: checkTask),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
