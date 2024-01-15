import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart' hide Response;
import 'package:tdesign_flutter/tdesign_flutter.dart';

class HttpPage extends StatelessWidget {
  HttpPage({super.key});

  final text = "".obs;

  @override
  Widget build(BuildContext context) {
    final title = Get.parameters["title"] ?? "";
    return ContainerView(
        title: title,
        body: Column(
          children: [
            const SizedBox(height: 10),
            TDButton(
              text: "请求",
              isBlock: true,
              theme: TDButtonTheme.primary,
              onTap: () async {
                String str = await _doGet();
                print(str);
                text.value = str;
              },
            ),
            Obx(() => TDText(text.value))
          ],
        ));
  }

  Future<String> _doGet() async {
    try {
      Dio dio = Dio();
      Response response =
          await dio.get<String>("https://www.wanandroid.com/friend/json");
      return response.data;
    } catch (e) {
      return "请求失败";
    }
  }
}
