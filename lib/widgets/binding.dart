import 'package:flutter_new/provider/provider.dart';
import 'package:flutter_new/task.dart/repository.dart';
import 'package:flutter_new/widgets/controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';

class HomeBinding implements Bindings {
  void dependencies() {
    Get.lazyPut(() => HomeController(
        taskRepository: TaskRepository(taskProvider: TaskProvider())));
  }
}
