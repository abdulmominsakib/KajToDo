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
    return GestureDetector(
      onLongPress: editTask,
      child: Container(
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
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    taskTitle,
                    style: kTaskTitle,
                  ),
                  Icon(
                    Icons.edit_location_outlined,
                    color: Color(0xFF6C63FF),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    taskDescription,
                    style: kTaskDescription,
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      'Medium',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
