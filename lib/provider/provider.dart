import 'dart:convert';

import 'package:flutter_new/models/tasks.dart';
import 'package:flutter_new/utiils/keys.dart';
import 'package:flutter_new/task.dart/services.dart';
import 'package:get/get.dart';

class TaskProvider {
  final StorageService _storage = Get.find<StorageService>();

  List<Task> readTask() {
    var tasks = <Task>[];
    jsonDecode(_storage.read(taskKey).toString())
        .forEach((e) => tasks.add(Task.fromJson(e)));
    return tasks;
  }

  void writeTasks(List<Task> tasks) {
    _storage.write(taskKey, jsonEncode(tasks));
  }
}
