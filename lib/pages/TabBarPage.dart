import 'package:flutter/material.dart';
import 'package:flutter_demo/controller/TabBarController.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TabBarPage extends StatelessWidget {
  TabBarPage({super.key});

  final TabBarController tabsController = Get.put(TabBarController());

  void onTapTab(BuildContext context, String tabName, int index) {
    tabsController.controller.index = index;
    TDToast.showText('点击了 $tabName', context: context);
  }

  @override
  Widget build(BuildContext context) {
    final title = Get.parameters["title"] ?? "";
    final appItems = [
      _AppItem(0, TDIcons.home, "主页"),
      _AppItem(1, TDIcons.view_module, "收藏"),
      _AppItem(2, TDIcons.thumb_up, "推荐"),
      _AppItem(3, TDIcons.user_circle, "我的"),
    ];

    return ContainerView(
        title: title,
        body: Column(
          children: [
            ///带胶囊背景的item选中样式
            TDBottomTabBar(TDBottomTabBarBasicType.iconText,
                componentType: TDBottomTabBarComponentType.label,
                outlineType: TDBottomTabBarOutlineType.filled,
                navigationTabs: appItems
                    .map((appItem) => TDBottomTabBarTabConfig(
                        onTap: () =>
                            onTapTab(context, appItem.label, appItem.index),
                        iconTextTypeConfig:
                            _buildTabConfig(context, appItem, 20)))
                    .toList()),

            ///普通item选中样式
            TDBottomTabBar(TDBottomTabBarBasicType.iconText,
                componentType: TDBottomTabBarComponentType.normal,
                outlineType: TDBottomTabBarOutlineType.filled,
                navigationTabs: appItems
                    .map((appItem) => TDBottomTabBarTabConfig(
                        onTap: () =>
                            onTapTab(context, appItem.label, appItem.index),
                        iconTextTypeConfig:
                            _buildTabConfig(context, appItem, 20)))
                    .toList()),
            ///关联ViewPager
            tabsController.viewPager
          ],
        ));
  }

  IconTextTypeConfig _buildTabConfig(
      BuildContext context, _AppItem appItem, double iconSize) {
    return IconTextTypeConfig(
        tabText: appItem.label,
        selectedIcon: Icon(
          appItem.icon,
          size: iconSize,
          color: TDTheme.of(context).brandNormalColor,
        ),
        unselectedIcon: Icon(
          appItem.icon,
          size: iconSize,
          color: TDTheme.of(context).fontGyColor1,
        ));
  }
}

class _AppItem {
  ///图标
  late int index;

  ///图标
  late IconData icon;

  ///标签
  late String label;

  _AppItem(this.index, this.icon, this.label);
}
