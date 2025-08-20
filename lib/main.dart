import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/pages/HomePage.dart';
import 'package:flutter_demo/route/AppPages.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

void main() {
  runApp(const MyApp());
  //沉浸式
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
  ));

  // 配置 GetX 日志
  Get.config(
    enableLog: true,
    logWriterCallback: (text, {bool isError = false}) {
      // 确保日志以 UTF-8 输出
      final encodedText = utf8.encode(Uri.decodeComponent(text));
      debugPrint(utf8.decode(encodedText));
    },
    defaultTransition: Transition.cupertino
  );
}

class MyApp extends GetMaterialApp {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(colorScheme: ColorScheme.light(primary: TDTheme.of(context).brandNormalColor));
    return TDTheme(
        data: TDThemeData.defaultData(),
        child: GetMaterialApp(
            theme: theme,
            initialRoute: AppPages.initialRoute,
            defaultTransition: Transition.rightToLeft,
            getPages: AppPages.pages,
            unknownRoute: AppPages.notFoundPage,
            home: const HomePage()));
  }
}
