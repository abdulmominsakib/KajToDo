import 'package:flutter/material.dart';
import 'package:kajtodo/modal/taskData.dart';
import 'package:kajtodo/styling/style.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:kajtodo/modal/task.dart';

class AddTask extends StatelessWidget {
  String taskName;
  String taskDesc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                alignment: Alignment.topRight,
                child: Hero(
                  tag: 'Avatar',
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/mypic.jpg'),
                    radius: 30,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  DefaultInput(
                    onChanged: (value) {
                      taskName = value;
                    },
                    autofocus: true,
                    icon: Icon(
                      Icons.edit,
                      color: Colors.lightBlue,
                    ),
                    labelText: 'Task Name',
                    hintText: 'Enter a name',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DefaultInput(
                    onChanged: (value) {
                      taskDesc = value;
                    },
                    icon: Icon(
                      Icons.description,
                      color: Colors.lightBlue,
                    ),
                    labelText: 'Description',
                    hintText: 'Enter a short description',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    elevation: 8,
                    color: Color(0xFF6C63FF),
                    onPressed: () {
                      Provider.of<TaskData>(context, listen: false).addTask(
                          taskName: taskName, taskDescription: taskDesc);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Add',
                      style: kSubBigText,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
