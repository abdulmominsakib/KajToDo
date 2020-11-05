import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kajtodo/component/completingTask/completedSingleTask.dart';
import 'package:kajtodo/modal/task.dart';
import 'package:kajtodo/modal/taskData.dart';
import 'package:kajtodo/styling/style.dart';
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
                    .deleteCompletedTask(index, task);
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("Task Deleted")));
              },
              background: DismissableBackground(),
              child: CompletedSingleTask(
                taskTitle: task.taskName,
                taskDescription: task.taskDescription ?? 'No Description',
                addToList: () {
                  Provider.of<TaskData>(context, listen: false)
                      .notDoneTask(index, task);
                },
                deleteTask: () {
                  Provider.of<TaskData>(context, listen: false)
                      .deleteCompletedTask(index, task);
                },
              ),
            );
          },
        );
      },
    );
  }
}
