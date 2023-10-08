import 'package:flutter/material.dart';
import 'package:flutter_demo/controller/TabsController.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';

class TabsPage extends StatelessWidget {
  TabsPage({super.key});

  final TabsController tabsController = Get.put(TabsController());

  @override
  Widget build(BuildContext context) {
    final title = Get.parameters["title"] ?? "";
    return ContainerView(
        title: title,
        body: Column(children: [
          tabsController.tabBar1,
          tabsController.tabBar2,
          tabsController.viewPager,
        ]));
  }
}
