import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DividerPage extends StatelessWidget {
  const DividerPage({super.key});

  @override
  Widget build(BuildContext context) {
    String title = Get.parameters["title"] ?? "";
    return ContainerView(
        title: title,
        body: const Column(
          children: [
            TDDivider(
              margin: EdgeInsets.all(12),
              color: Colors.redAccent,
            )
          ],
        ));
  }
}
