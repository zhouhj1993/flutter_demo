import 'package:flutter/material.dart';
import 'package:flutter_demo/route/AppPages.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final list = AppPages.routeModel;
    return ContainerView(
        title: "Home",
        useDefaultBack: false,
        body: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
              return TDButton(
                  margin: const EdgeInsets.only(left: 12, top: 6, right: 12),
                  isBlock: true,
                  theme: TDButtonTheme.light,
                  type: TDButtonType.outline,
                  text: list[index].routeName,
                  onTap: () {
                    final params = <String, String>{"title": item.routeName};
                    Get.toNamed(item.routeUrl, parameters: params);
                  });
            }));
  }
}
