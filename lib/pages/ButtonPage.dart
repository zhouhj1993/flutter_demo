import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    String title = Get.parameters["title"] ?? "";
    return ContainerView(
        title: title,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ElevatedButton(onPressed: null, child: Text("不可点击")),
              ElevatedButton(
                  onPressed: () {
                    GFToast.showToast("点击", context,
                        toastPosition: GFToastPosition.BOTTOM);
                  },
                  child: const Text("可点击")),
            ],
          ),
        ));
  }
}
