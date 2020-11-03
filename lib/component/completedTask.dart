import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kajtodo/component/completedSingleTask.dart';
import 'package:kajtodo/modal/task.dart';
import 'package:kajtodo/modal/taskData.dart';
import 'package:provider/provider.dart';

class CompletedTaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.completedTask.length,
          itemBuilder: (BuildContext context, int index) {
            Task task = taskData.completedTask[index];
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                Provider.of<TaskData>(context, listen: false)
                    .deleteCompletedTask(task);
              },
              background: Container(
                color: Colors.redAccent,
              ),
              child: CompletedSingleTask(
                taskTitle: task.taskName,
                taskDescription: task.taskDescription ?? 'No Description',
                addToList: () {
                  Provider.of<TaskData>(context, listen: false)
                      .notDoneTask(task);
                },
                deleteTask: () {
                  Provider.of<TaskData>(context, listen: false)
                      .deleteCompletedTask(task);
                },
              ),
            );
          },
        );
      },
    );
  }
}
