import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'component/mainHeader.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
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
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () {},
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
