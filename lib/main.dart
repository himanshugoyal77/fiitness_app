import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new/login_page.dart';
import 'package:flutter_new/pages/home_page.dart';
import 'package:flutter_new/task.dart/page_3.dart';
import 'package:flutter_new/task.dart/services.dart';
import 'package:flutter_new/widgets/binding.dart';
import 'package:flutter_new/widgets/view.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  await GetStorage.init();

  await Get.putAsync(() => StorageService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      initialBinding: HomeBinding(),
      builder: EasyLoading.init(),
    );
  }
}
