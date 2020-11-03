import 'package:flutter/material.dart';
import 'package:kajtodo/component/taskListBuilder.dart';
import 'package:kajtodo/modal/taskData.dart';
import 'package:provider/provider.dart';

import 'completedTask.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // To Check Which Screen Should We Give
    bool button = Provider.of<TaskData>(context, listen: false).homeIsTapped;
    return Expanded(
      flex: 5,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: button == true ? TaskBuilder() : CompletedTaskList(),
      ),
    );
  }
}
