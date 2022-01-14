import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_new/utiils/extensions.dart';
import 'package:flutter_new/values/colors.dart';
import 'package:flutter_new/widgets/controller.dart';
import 'package:get/get.dart';

class AddDialog extends StatelessWidget {
  final homectrl = Get.find<HomeController>();
  AddDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: homectrl.formKey,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                        homectrl.editCtrl.clear();
                        homectrl.changeTask(null);
                      },
                      icon: const Icon(Icons.close)),
                  TextButton(
                    style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent)),
                    onPressed: () {
                      if (homectrl.formKey.currentState!.validate()) {
                        if (homectrl.task.value == null) {
                          EasyLoading.showError("select TAskType");
                        } else {
                          var success = homectrl.updateTask(
                            homectrl.task.value!,
                            homectrl.editCtrl.text,
                          );
                          if (success) {
                            EasyLoading.showSuccess("Todo Success");
                            Get.back();
                            homectrl.changeTask(null);
                          } else {
                            EasyLoading.showError('Item Already Exists');
                          }
                          homectrl.editCtrl.clear();
                        }
                      }
                    },
                    child: const Text("done", style: TextStyle(fontSize: 20)),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "New Task",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                controller: homectrl.editCtrl,
                decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[400]!,
                  ),
                )),
                autofocus: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "please enter todo item";
                  }
                  return null;
                },
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 15),
              child: Text(
                "add To,",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            ...homectrl.tasks.map((element) => Obx(
                  () => InkWell(
                    onTap: () => homectrl.changeTask(element),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                IconData(element.icon,
                                    fontFamily: "MaterialIcons"),
                                color: green,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                element.title,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          if (homectrl.task.value == element)
                            const Icon(
                              Icons.check,
                              color: Colors.blue,
                            )
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
