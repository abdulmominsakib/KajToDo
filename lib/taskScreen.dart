import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'component/sharedComponent/mainHeader.dart';
import 'modal/taskData.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  Color colorOfList;
  Color colorOfCheckList;

  void changeColor() {
    setState(() {
      // Change Color Function
      bool button = Provider.of<TaskData>(context, listen: false).homeIsTapped;
      // Checking
      if (button == true) {
        colorOfList = Colors.blue;
        colorOfCheckList = null;
      } else {
        colorOfCheckList = Colors.blue;
        colorOfList = null;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // It will change the color of clickedButton
    changeColor();
    // Add the task to the list from database
    Provider.of<TaskData>(context, listen: false).addToList();
    Provider.of<TaskData>(context, listen: false).addToCompletedList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.list_alt_outlined,
                color: colorOfList,
              ),
              onPressed: () {
                // The taskscreen button is tapped
                Provider.of<TaskData>(context, listen: false).homeIsTapped =
                    true;
                changeColor();
              },
            ),
            IconButton(
              icon: Icon(
                Icons.check_box_outlined,
                color: colorOfCheckList,
              ),
              onPressed: () {
                // theCompletedTaskScreen button is clicked
                Provider.of<TaskData>(context, listen: false).homeIsTapped =
                    false;
                changeColor();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFFAD83FE),
        label: Text('Add a Task'),
        splashColor: Colors.blue,
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'addScreen');
        },
        tooltip: 'Add Task',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 0.0),
            colors: [Colors.blue, Colors.purple],
          ),
        ),
        child: MainHeader(),
      ),
    );
  }
}
