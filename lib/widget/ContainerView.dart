import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ContainerView extends StatelessWidget {
  /// 组件
  final Widget body;

  /// 标题
  final String title;

  /// 是否启用topbar
  final bool useTopbar;

  /// 是否启用左侧返回按钮
  final bool useDefaultBack;

  /// 返回事件
  final VoidCallback? onBack;

  /// 背景颜色
  final Color? backgroundColor;

  /// 自定义左边操作项
  final List<TDNavBarItem>? leftBarItems;

  /// 自定义右边操作项
  final List<TDNavBarItem>? rightBarItems;

  const ContainerView({
    super.key,
    required this.body,
    this.title = "",
    this.useTopbar = true,
    this.useDefaultBack = true,
    this.onBack,
    this.backgroundColor = Colors.white,
    this.leftBarItems,
    this.rightBarItems,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          if (useTopbar) _buildNavBar(context),
          Expanded(child: body),
        ],
      ),
    );
  }

  /// 构建TopBar
  TDNavBar _buildNavBar(BuildContext context) {
    return TDNavBar(
      title: title,
      leftBarItems: _buildLeftItems(),
      rightBarItems: rightBarItems,
      useDefaultBack: false,
      titleColor: TDTheme.of(context).whiteColor1,
      backgroundColor: TDTheme.of(context).brandNormalColor,
    );
  }

  /// 构建Topbar左侧按钮
  List<TDNavBarItem>? _buildLeftItems() {
    final backItem = TDNavBarItem(
        icon: TDIcons.chevron_left,
        iconSize: 24,
        iconColor: Colors.white,
        action: () {
          onBack == null ? Get.back() : onBack?.call();
        });
    return useDefaultBack ? [backItem] : leftBarItems;
  }
}
