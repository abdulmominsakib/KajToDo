import 'package:flutter/material.dart';
import 'package:kajtodo/styling/style.dart';

class CompletedSingleTask extends StatelessWidget {
  CompletedSingleTask(
      {this.taskTitle, this.taskDescription, this.deleteTask, this.addToList});

  final String taskTitle;
  final String taskDescription;
  final Function addToList;
  final Function deleteTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      height: 100,
      margin: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.deepPurpleAccent,
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
                  style: kTaskTitle.copyWith(color: Colors.white),
                ),
                IconButton(
                    icon: Icon(
                      Icons.list_alt_outlined,
                      color: Colors.white,
                    ),
                    onPressed: addToList),
              ],
            ),
            Container(
              padding: EdgeInsets.all(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    taskDescription,
                    style: kTaskDescription.copyWith(color: Colors.white),
                  ),
                  IconButton(
                      tooltip: 'Swipe To Delete',
                      icon: Icon(
                        Icons.delete_outline_outlined,
                        color: Colors.white,
                      ),
                      onPressed: deleteTask),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
