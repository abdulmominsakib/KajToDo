import 'package:flutter/material.dart';
import 'package:kajtodo/styling/style.dart';

class SingleTask extends StatelessWidget {
  SingleTask(
      {this.taskTitle, this.taskDescription, this.checkTask, this.editTask});

  final String taskTitle;
  final String taskDescription;
  final Function editTask;
  final Function checkTask;

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
            ),
          ],
        ),
      ),
    );
  }
}
