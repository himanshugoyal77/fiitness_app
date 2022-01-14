import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_new/models/tasks.dart';
import 'package:flutter_new/utiils/extensions.dart';
import 'package:flutter_new/widgets/controller.dart';
import 'package:flutter_new/widgets/detail_view.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TaskCard extends StatelessWidget {
  final HomeCtrl = Get.find<HomeController>();
  final Task task;
  TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final color = HexColor.fromHex(task.color);
    var SquaureWidth = Get.width - 12.0;
    return GestureDetector(
      onTap: () {
        HomeCtrl.changeTask(task);
        HomeCtrl.changeTodos(task.todos ?? []);
        Get.to(() => DetailPage());
      },
      child: Container(
        width: SquaureWidth / 2,
        height: SquaureWidth / 2,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey[300]!, blurRadius: 7, offset: Offset(0, 7))
        ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StepProgressIndicator(
              totalSteps: 100,
              currentStep: 80,
              size: 5,
              padding: 0,
              selectedGradientColor: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.purple, Colors.deepPurple]),
              unselectedGradientColor: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Colors.white,
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                IconData(
                  task.icon,
                  fontFamily: "materialIcons",
                ),
                color: Colors.deepPurple,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Text(
                    "${task.todos?.length ?? 0} Task",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
