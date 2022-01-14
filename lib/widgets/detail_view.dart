import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_new/values/colors.dart';
import 'package:flutter_new/widgets/controller.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class DetailPage extends StatelessWidget {
  final homCtrl = Get.find<HomeController>();
  DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var task = homCtrl.task.value;
    return Scaffold(
        body: Form(
      key: homCtrl.formKey,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                      homCtrl.updateTodos();
                      homCtrl.changeTask(null);
                      homCtrl.editCtrl.clear();
                    },
                    icon: const Icon(Icons.arrow_back))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Icon(
                  IconData(task!.icon, fontFamily: "materialIcon"),
                  color: purple,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  task.title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Obx(() {
            var totalTodos =
                homCtrl.doingTodos.length + homCtrl.doneTodos.length;
            return Padding(
              padding: const EdgeInsets.only(left: 38, right: 38),
              child: Row(
                children: [
                  Text(
                    "$totalTodos Tasks",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60, right: 10),
                      child: CircularStepProgressIndicator(
                        totalSteps: totalTodos == 0 ? 1 : totalTodos,
                        currentStep: homCtrl.doneTodos.length,
                        stepSize: 10,
                        selectedColor: Colors.greenAccent,
                        unselectedColor: Colors.grey[200],
                        padding: 0,
                        width: 150,
                        height: 150,
                        selectedStepSize: 15,
                        roundedCap: (_, __) => true,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: TextFormField(
              controller: homCtrl.editCtrl,
              autofocus: true,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400]!)),
                  prefixIcon: Icon(
                    Icons.check_box_outline_blank,
                    color: Colors.grey[400],
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (homCtrl.formKey.currentState!.validate()) {
                        var success = homCtrl.addTodo(homCtrl.editCtrl.text);
                        if (success) {
                          EasyLoading.showSuccess("Todo Item success");
                        } else {
                          EasyLoading.showError("Todo Already Exist");
                        }
                        homCtrl.editCtrl.clear();
                      }
                    },
                    icon: Icon(Icons.done),
                  )),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please Tick CheckBox";
                }
                return null;
              },
            ),
          )
        ],
      ),
    ));
  }
}
