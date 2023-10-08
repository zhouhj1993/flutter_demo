import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TabsController extends GetxController with GetTickerProviderStateMixin {
  late TabController controller1;
  late TDTabBar tabBar1;
  late TDTabBar tabBar2;
  late Expanded viewPager;

  @override
  void onInit() {
    super.onInit();
    controller1 = TabController(length: 2, vsync: this);
    tabBar1 = TDTabBar(
      onTap: (index) {
        if (Get.overlayContext != null) {
          TDToast.showText("text$index", context: Get.overlayContext!);
        }
      },
      tabs: const [
        TDTab(text: "选项1", icon: Icon(TDIcons.app, size: 18)),
        TDTab(text: "选项2", icon: Icon(TDIcons.app, size: 18)),
      ],
      controller: controller1,
      backgroundColor: Colors.white,
      showIndicator: true,
      outlineType: TDTabBarOutlineType.filled,
    );

    tabBar2 = TDTabBar(
      tabs: const [
        TDTab(
          text: "选项1",
          icon: Icon(TDIcons.app, size: 18),
          badge: TDBadge(
            TDBadgeType.message,
            count: "8",
          ),
        ),
        TDTab(
          text: "选项2",
          icon: Icon(TDIcons.app, size: 18),
          badge: TDBadge(
            TDBadgeType.bubble,
            count: "8",
          ),
        ),
      ],
      controller: controller1,
      backgroundColor: Colors.white,
      showIndicator: true,
      outlineType: TDTabBarOutlineType.filled,
    );

    viewPager = Expanded(
      child: TabBarView(
        controller: controller1,
        children: const [
          Center(child: TDText("内容1")),
          Center(child: TDText("内容2")),
        ],
      ),
    );
  }
}
