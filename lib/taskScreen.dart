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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFAD83FE),
        splashColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'addScreen');
        },
        tooltip: 'Add Task',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: Colors.blue,
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
