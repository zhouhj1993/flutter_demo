import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class TextPage extends StatelessWidget {
  const TextPage({super.key});

  @override
  Widget build(BuildContext context) {
    String title = Get.parameters["title"] ?? "";
    return ContainerView(
        title: title,
        body: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Text(
                  "系统text",
                  style: TextStyle(
                      color: Colors.redAccent, backgroundColor: Colors.amber),
                ),
              ),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: TDText(
                    "TDText",
                    font: TDTheme.of(context).fontBodyMedium,
                    textColor: Colors.redAccent,
                    backgroundColor: Colors.amber,
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: TDText.rich(TextSpan(children: [
                    TDTextSpan(
                        text: "span1",
                        textColor: Colors.redAccent,
                        style: TextStyle(backgroundColor: Colors.brown)),
                    TDTextSpan(
                        text: "  span2",
                        textColor: Colors.greenAccent,
                        style: TextStyle(backgroundColor: Colors.amber))
                  ])))
            ],
          ),
        ));
  }
}
