import 'package:flutter/material.dart';
import 'package:kajtodo/styling/style.dart';
import 'package:provider/provider.dart';
import 'package:kajtodo/modal/taskData.dart';

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String taskName;

  String taskDesc;
  String counterText = '';

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
                    counterText: counterText,
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
                    counterText: '',
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    padding: EdgeInsets.only(
                        left: 40, right: 40, top: 10, bottom: 10),
                    elevation: 8,
                    color: Color(0xFF6C63FF),
                    onPressed: () {
                      if (taskName != null) {
                        Provider.of<TaskData>(context, listen: false).addTask(
                            taskName: taskName, taskDescription: taskDesc);
                        Navigator.pop(context);
                      } else {
                        counterText = 'Please Add A Name';
                        setState(() {});
                      }
                    },
                    child: Text(
                      'Add',
                      style: kSubBigText,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    child: RaisedButton(
                      elevation: 8,
                      color: Color(0xFF6C63FF),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Back',
                        style: kSubBigText,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
