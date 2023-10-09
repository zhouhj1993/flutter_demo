import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class SliderPage extends StatelessWidget {
  SliderPage({super.key});

  var _value = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    final title = Get.parameters["title"] ?? "";
    return ContainerView(
        title: title,
        body: Column(
          children: [
            Obx(() => Slider(
                thumbColor: Colors.white,
                min: 0,
                max: 100,
                divisions: 100,
                label: _value.value.round().toString(),
                value: _value.value,
                onChanged: (value) {
                  _value.value = value;
                })),
            TDSlider(
              //这个好像有bug，看源代码，单滑块设置showThumbValue没有绘制value
              sliderThemeData: TDSliderThemeData(
                showScaleValue: true,
                showThumbValue: true,
                min: 0,
                max: 100,
                scaleFormatter: (value) => value.toInt().toString(),
              ),
              leftLabel: '0',
              rightLabel: '100',
              value: 20,
              onChanged: (value) {},
            ),
            TDRangeSlider(
              sliderThemeData: TDSliderThemeData(
                showThumbValue: true,
                min: 0,
                max: 100,
                scaleFormatter: (value) => value.toInt().toString(),
              ),
              leftLabel: '0',
              rightLabel: '100',
              value: const RangeValues(20, 60),
              onChanged: (value) {},
            )
          ],
        ));
  }
}
