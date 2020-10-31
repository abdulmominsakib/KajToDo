import 'package:provider/provider.dart';

class Task extends ChangeNotifierProvider {
  Task({this.taskName, this.taskDescription});
  final String taskName;
  final String taskDescription;
}
