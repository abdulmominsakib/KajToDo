import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:kajtodo/component/addingTask/add-task.dart';
import 'package:kajtodo/introductionScreen.dart';
import 'package:kajtodo/taskScreen.dart';
import 'package:provider/provider.dart';
import 'package:kajtodo/modal/taskData.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'modal/task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('TaskList');
  await Hive.openBox<Task>('Completed');
  runApp(TaskApp());
  // it will create two Box, one for tasklist and other for completed tasklist
  // WidgetsFLutterBInding is required otherwise it will not work.
}

class TaskApp extends StatefulWidget {
  @override
  _TaskAppState createState() => _TaskAppState();
}

class _TaskAppState extends State<TaskApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => Intro(),
          'taskScreen': (context) => TaskScreen(),
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
