import 'package:flutter/material.dart';
import 'package:kajtodo/modal/task.dart';
import 'package:kajtodo/styling/style.dart';
import 'package:provider/provider.dart';
import 'package:kajtodo/modal/taskData.dart';

class EditTask extends StatefulWidget {
  // Get the datafrom taskScreen
  // index is required so that we can check which task to edit
  final Task task;
  final int index;

  EditTask({this.task, this.index});

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  // All the required variables for this page
  TextEditingController nameController;
  TextEditingController descController;
  String taskName;
  String taskDesc;
  String counterText = '';

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.task.taskName);
    descController = TextEditingController(text: widget.task.taskDescription);
  }

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
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  DefaultInput(
                    controller: nameController,
                    onChanged: (value) {
                      taskName = value;
                    },
                    autofocus: true,
                    icon: Icon(
                      Icons.edit,
                      color: Colors.lightBlue,
                    ),
                    labelText: 'Edit Task Name',
                    hintText: 'Enter a name',
                    counterText: counterText,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                    child: DefaultInput(
                      controller: descController,
                      onChanged: (value) {
                        /* taskname is added because if user has inputted 
                        nothing on the taskname then it will return null value
                        to the String variable, because it is not triggered,
                        but if user clicked on the description then it will
                        trigger the onchanged so it will add the the value of 
                        text controller to here!0
                         */
                        taskName = nameController.text;
                        taskDesc = value;
                      },
                      icon: Icon(
                        Icons.description,
                        color: Colors.lightBlue,
                      ),
                      labelText: 'Edit Description',
                      hintText: 'Enter a short description',
                      counterText: '',
                    ),
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
                      // Checking if user has inputted data
                      if (taskName != null) {
                        // Disable Keyboard Popup to avoid pixel issues on
                        // the next ScreenBuild
                        FocusScope.of(context).requestFocus(new FocusNode());

                        Provider.of<TaskData>(context, listen: false)
                            .updateTask(
                          taskNum: widget.index,
                          updatedTaskName: taskName,
                          updatedDescription: taskDesc,
                        );

                        Navigator.pop(context);
                      } else {
                        // No user input then Show ERROR MESSAGE
                        setState(() {
                          counterText = 'Please Update the name';
                        });
                      }
                    },
                    child: Text(
                      'Update',
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
                        FocusScope.of(context).requestFocus(new FocusNode());
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
