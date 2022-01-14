import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_new/models/tasks.dart';
import 'package:flutter_new/utiils/extensions.dart';
import 'package:flutter_new/values/icons.dart';
import 'package:flutter_new/widgets/controller.dart';
import 'package:flutter_new/widgets/iconm.dart';

import 'package:get/get.dart';

class AddCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  AddCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final icons = getIcons();
    var squarewidth = Get.width - 12.0;
    return Container(
      height: squarewidth / 2,
      width: squarewidth / 2,
      margin: EdgeInsets.all(3.0),
      child: InkWell(
        onTap: () async {
          await Get.defaultDialog(
              titlePadding: EdgeInsets.symmetric(vertical: 10),
              radius: 5,
              title: "Type Task",
              content: Form(
                key: homeCtrl.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: TextFormField(
                        controller: homeCtrl.editCtrl,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Task",
                        ),
                        validator: (Value) {
                          if (Value == null || Value.trim().isEmpty) {
                            return "please enter Task";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Wrap(
                        spacing: 4,
                        children: icons
                            .map((e) => Obx(() {
                                  final index = icons.indexOf(e);
                                  return ChoiceChip(
                                    selectedColor: Colors.grey[200],
                                    pressElevation: 0,
                                    backgroundColor: Colors.white,
                                    label: e,
                                    selected: homeCtrl.chipIndex.value == index,
                                    onSelected: (bool selected) {
                                      homeCtrl.chipIndex.value =
                                          selected ? index : 0;
                                    },
                                  );
                                }))
                            .toList(),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: Size(120, 50)),
                      onPressed: () {
                        if (homeCtrl.formKey.currentState!.validate()) {
                          int icon =
                              icons[homeCtrl.chipIndex.value].icon!.codePoint;
                          String color =
                              icons[homeCtrl.chipIndex.value].color!.toString();
                          var task = Task(
                            title: homeCtrl.editCtrl.text,
                            icon: icon,
                            color: color,
                          );
                          Get.back();
                          homeCtrl.addTask(task)
                              ? EasyLoading.showSuccess("Create sucess")
                              : EasyLoading.showError("Duplicate TAsk");
                        }
                      },
                      child: Text("confirm"),
                    )
                  ],
                ),
              ));
          homeCtrl.editCtrl.clear();
          homeCtrl.changeChipIndex(0);
        },
        child: DottedBorder(
          color: Colors.grey[400]!,
          dashPattern: [8, 4],
          child: Center(
            child: Icon(
              Icons.add,
              size: 20.0,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
