import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class CheckboxPage extends StatelessWidget {
  const CheckboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    final title = Get.parameters["title"] ?? "";
    return ContainerView(
        backgroundColor: Colors.grey.shade200,
        title: title,
        body: Column(
          children: [
            TDCheckboxGroupContainer(
              selectIds: const ["index:0"],
              direction: Axis.vertical,
              directionalTdCheckboxes: const [
                TDCheckbox(
                  id: "index:0",
                  title: "单选",
                  style: TDCheckboxStyle.circle,
                  enable: false,
                ),
                TDCheckbox(
                  id: "index:1",
                  title: "单选",
                  style: TDCheckboxStyle.circle,
                )
              ],
            ),
            const SizedBox(height: 10),
            TDCheckboxGroupContainer(
              selectIds: const ['index:0'],
              passThrough: true,
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (contet, index) {
                  var title = '单选';
                  return TDCheckbox(
                    id: 'index:$index',
                    title: title,
                    size: TDCheckBoxSize.large,
                  );
                },
                itemCount: 4,
              ),
            ),
            const SizedBox(height: 10),
            TDCheckboxGroupContainer(
              cardMode: true,
              selectIds: const ["index:0"],
              direction: Axis.vertical,
              directionalTdCheckboxes: const [
                TDCheckbox(
                  cardMode: true,
                  id: "index:0",
                  title: "单选",
                  style: TDCheckboxStyle.circle,
                ),
                TDCheckbox(
                  cardMode: true,
                  id: "index:1",
                  title: "单选",
                  style: TDCheckboxStyle.circle,
                )
              ],
              onCheckBoxGroupChange: (ids) {
                print(ids);
              },
            )
          ],
        ));
  }
}
