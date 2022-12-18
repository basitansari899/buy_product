import 'package:flutter/material.dart';
import 'package:food_court/routes/app_pages.dart';
import 'package:food_court/utils/ui_data.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: UIData.appName,
      theme: ThemeData(
          primaryColor: Colors.black,
          primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      defaultTransition: Get.defaultTransition,
      showPerformanceOverlay: false,
      enableLog: true,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
