import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'component/mainHeader.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFAD83FE),
          splashColor: Colors.blue,
          child: Icon(Icons.add),
          onPressed: () {},
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
      ),
    );
  }
}
