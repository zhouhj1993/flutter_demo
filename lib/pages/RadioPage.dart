import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class RadioPage extends StatelessWidget {
  const RadioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final title = Get.parameters["title"] ?? "";
    return ContainerView(
        backgroundColor: Colors.grey.shade200,
        title: title,
        body: Column(
          children: [
            TDRadioGroup(
              selectId: "index:0",
              direction: Axis.vertical,
              directionalTdRadios: [
                TDRadio(
                  id: "index:0",
                  title: "单选",
                  radioStyle: TDRadioStyle.circle,
                  enable: false,
                ),
                TDRadio(
                  id: "index:1",
                  title: "单选",
                  radioStyle: TDRadioStyle.hollowCircle,
                )
              ],
            ),
            const SizedBox(height: 10),
            TDRadioGroup(
              selectId: 'index:0',
              passThrough: true,
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (contet, index) {
                  var title = '单选';
                  return TDRadio(
                    id: 'index:$index',
                    title: title,
                    size: TDCheckBoxSize.large,
                  );
                },
                itemCount: 4,
              ),
            ),
            const SizedBox(height: 10),
            TDRadioGroup(
              cardMode: true,
              selectId: "index:0",
              direction: Axis.vertical,
              directionalTdRadios: [
                TDRadio(
                  cardMode: true,
                  id: "index:0",
                  title: "单选",
                  radioStyle: TDRadioStyle.circle,
                ),
                TDRadio(
                  cardMode: true,
                  id: "index:1",
                  title: "单选",
                  radioStyle: TDRadioStyle.hollowCircle,
                )
              ],
            )
          ],
        ));
  }
}
