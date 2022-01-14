import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_new/models/tasks.dart';
import 'package:flutter_new/values/colors.dart';
import 'package:flutter_new/widgets/add_card.dart';
import 'package:flutter_new/widgets/add_dialog.dart';
import 'package:flutter_new/widgets/controller.dart';
import 'package:flutter_new/widgets/task_card.dart';
import 'package:get/get.dart';
import 'package:flutter_new/utiils/extensions.dart';

class Page3 extends GetView<HomeController> {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "My List",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: GridView.count(
                  physics: const ClampingScrollPhysics(),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: <Widget>[
                    ...controller.tasks
                        .map((element) => LongPressDraggable(
                            data: element,
                            onDragStarted: () =>
                                controller.changeDeleting(true),
                            onDraggableCanceled: (_, __) =>
                                controller.changeDeleting(false),
                            onDragEnd: (_) => controller.changeDeleting(false),
                            feedback: Opacity(
                              opacity: 0.8,
                              child: TaskCard(task: element),
                            ),
                            child: TaskCard(task: element)))
                        .toList(),
                    AddCard()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 70),
        child: DragTarget<Task>(
          builder: (_, __, ___) {
            return Obx(
              () => FloatingActionButton(
                backgroundColor: controller.deleting.value ? Colors.red : blue,
                onPressed: () => {
                  if (controller.tasks.isNotEmpty)
                    {
                      Get.to(() => AddDialog(),
                          transition: Transition.downToUp),
                    }
                  else
                    {
                      EasyLoading.showInfo("Please Create Your Task"),
                    }
                },
                child:
                    Icon(controller.deleting.value ? Icons.delete : Icons.add),
              ),
            );
          },
          onAccept: (Task task) {
            controller.deleteTask(task);
            EasyLoading.showSuccess("Delete Sucess");
          },
        ),
      ),
    );
  }
}
