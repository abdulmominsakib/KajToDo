import 'package:flutter/material.dart';
import 'package:kajtodo/taskScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaskScreen(),
      theme: ThemeData(
        primaryColor: Color(0xFFAD83FE),
        accentColor: Color(0xFF6C63FF),
        fontFamily: 'Montserrat',
      ),
    ),
  );
}
