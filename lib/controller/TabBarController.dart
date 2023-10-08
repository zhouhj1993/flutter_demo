import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TabBarController extends GetxController with GetTickerProviderStateMixin {
  late TabController controller;
  late Expanded viewPager;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: 4, vsync: this);

    viewPager = Expanded(
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          Center(child: TDText("内容1")),
          Center(child: TDText("内容2")),
          Center(child: TDText("内容3")),
          Center(child: TDText("内容4")),
        ],
      ),
    );
  }
}
