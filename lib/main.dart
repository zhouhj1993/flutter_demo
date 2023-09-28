import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/HomePage.dart';
import 'package:flutter_demo/route/AppPages.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends GetMaterialApp {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialRoute: AppPages.initialRoute,
        defaultTransition: Transition.rightToLeft,
        getPages: AppPages.pages,
        unknownRoute: AppPages.notFoundPage,
        home: const HomePage());
  }
}
