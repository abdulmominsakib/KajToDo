import 'package:hive/hive.dart';

// This file will generate data class for our TASK modal.
part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  Task({this.taskName, this.taskDescription});
  @HiveField(0)
  final String taskName;
  @HiveField(1)
  final String taskDescription;
}

/* <--- The hive TYPE and FIELDS are different. And the field and type should 
  increasing by 1, so it will be on order. ---> */
