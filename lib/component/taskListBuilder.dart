import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kajtodo/component/edit-page.dart';
import 'package:kajtodo/component/singleTask.dart';
import 'package:kajtodo/modal/task.dart';
import 'package:kajtodo/modal/taskData.dart';
import 'package:kajtodo/styling/style.dart';
import 'package:provider/provider.dart';

class TaskBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.tasksList.length,
          itemBuilder: (BuildContext context, int index) {
            Task task = taskData.tasksList[index];

            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                Provider.of<TaskData>(context, listen: false).deleteTask(task);
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text("Task Deleted")));
              },
              background: DismissableBackground(),
              child: SingleTask(
                taskTitle: task.taskName,
                taskDescription: task.taskDescription ?? 'No Description',
                checkTask: () {
                  Provider.of<TaskData>(context, listen: false).doneTask(task);
                },
                editTask: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditTask(
                        // for passing task data to edit screen
                        task: task,
                        // It will pass the current index (int) to next Screen
                        index: index,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
