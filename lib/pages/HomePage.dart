import 'package:flutter/material.dart';
import 'package:flutter_demo/route/AppPages.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final list = AppPages.routeModel;
    return ContainerView(
        title: "Home",
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
              return ElevatedButton(
                  onPressed: () {
                    final params = <String, String>{"title": item.routeName};
                    Get.toNamed(item.routeUrl, parameters: params);
                  },
                  child: Text(list[index].routeName));
            }));
  }
}
