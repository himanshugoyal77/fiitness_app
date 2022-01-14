import 'package:flutter_new/models/tasks.dart';
import 'package:flutter_new/provider/provider.dart';

class TaskRepository {
  TaskProvider taskProvider;
  TaskRepository({required this.taskProvider});

  List<Task> readTasks() => taskProvider.readTask();
  void writeTasks(List<Task> tasks) => taskProvider.writeTasks(tasks);
}
