import 'package:flutter/material.dart';
import 'package:kajtodo/component/add-task.dart';
import 'package:kajtodo/component/edit-page.dart';
import 'package:kajtodo/taskScreen.dart';
import 'package:provider/provider.dart';
import 'package:kajtodo/modal/taskData.dart';

void main() {
  runApp(TaskApp());
}

class TaskApp extends StatefulWidget {
  @override
  _TaskAppState createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => TaskScreen(),
          'addScreen': (context) => AddTask(),
        },
        theme: ThemeData(
          primaryColor: Color(0xFFAD83FE),
          accentColor: Color(0xFF6C63FF),
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}
