import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SwitchPage extends StatelessWidget {
  const SwitchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final title = Get.parameters["title"] ?? "";
    return ContainerView(
        backgroundColor: Colors.grey.shade200,
        title: title,
        body: Column(
          children: [
            _buildItem("基础开关", const TDSwitch()),
            _buildItem("绿色开关", const TDSwitch(trackOnColor: Colors.green)),
            _buildItem("默认开", const TDSwitch(isOn: true)),
            _buildItem("开关大小", const TDSwitch(size: TDSwitchSize.small)),
            _buildItem("禁用关状态", const TDSwitch(enable: false)),
            _buildItem("禁用开状态", const TDSwitch(enable: false,isOn: true,)),
          ],
        ));
  }

  Widget _buildItem(String title, TDSwitch child) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.white,
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [TDText(title), child],
      ),
    );
  }
}
