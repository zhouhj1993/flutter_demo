import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _AState();
}

class _AState extends State<InputPage> {
  final editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final title = Get.parameters["title"] ?? "";
    return ContainerView(
        title: title,
        body: Column(
          children: [
            TDInput(
              leftLabel: '标签',
              controller: editingController,
              backgroundColor: Colors.white,
              hintText: '请输入文字',
              required: true,
              obscureText: true,
              onChanged: (text) {
                setState(() {});
              },
              onClearTap: () {
                editingController.clear();
                setState(() {});
              },
            )
          ],
        ));
  }
}
