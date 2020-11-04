import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task {
  Task({this.taskName, this.taskDescription});
  @HiveField(0)
  final String taskName;
  @HiveField(1)
  final String taskDescription;
}
