import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class ContainerView extends StatelessWidget {
  /// 标题
  final String title;

  /// 背景颜色
  final Color? backgroundColor;

  /// 组件
  final Widget body;

  final bool useDefaultBack;

  /// 返回事件
  final VoidCallback? onBack;

  const ContainerView({
    super.key,
    required this.title,
    required this.body,
    this.useDefaultBack = true,
    this.onBack,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          TDNavBar(
            leftBarItems: _buildNavBarItems(),
            useDefaultBack: false,
            titleColor: TDTheme.of(context).whiteColor1,
            title: title,
            backgroundColor: TDTheme.of(context).brandNormalColor,
          ),
          Expanded(child: body)
        ],
      ),
    );
  }

  List<TDNavBarItem>? _buildNavBarItems() {
    final backItem = TDNavBarItem(
        icon: TDIcons.chevron_left,
        iconSize: 24,
        iconColor: Colors.white,
        action: () {
          onBack == null ? Get.back() : onBack?.call();
        });
    return useDefaultBack ? [backItem] : null;
  }
}
