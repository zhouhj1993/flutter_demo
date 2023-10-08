import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PickerPage extends StatelessWidget {
  PickerPage({super.key});

  final selected1 = "".obs;
  final selected2 = "".obs;
  final selected3 = "".obs;
  final selected4 = "".obs;
  final selected5 = "".obs;

  final data1 = ["2020", "2021", "2022", "2023"];
  final date2 = [
    ["2020", "2021", "2022", "2023"],
    ["春", "夏", "秋", "冬"]
  ];
  Map data5 = {
    '广东省': {
      '深圳市': ['南山区', '宝安区', '罗湖区', '福田区'],
      '佛山市': [''],
      '广州市': ['花都区']
    },
    '重庆市': {
      '重庆市': ['九龙坡区', '江北区']
    },
    '浙江省': {
      '杭州市': ['西湖区', '余杭区', '萧山区'],
      '宁波市': ['江东区', '北仑区', '奉化市']
    },
    '香港': {
      '香港': ['九龙城区', '黄大仙区', '离岛区', '湾仔区']
    }
  };

  @override
  Widget build(BuildContext context) {
    final title = Get.parameters["title"] ?? "";
    return ContainerView(
        backgroundColor: Colors.grey.shade200,
        title: title,
        body: Column(
          children: [
            Obx(() =>
                GestureDetector(
                  child: buildSelectRow(context, selected1.value, "选择年份"),
                  onTap: () {
                    TDPicker.showMultiPicker(context, title: "选择年份",
                        onConfirm: (selected) {
                          selected1.value = data1[selected[0]];
                        }, data: [data1]);
                  },
                )),
            Obx(() =>
                GestureDetector(
                  child: buildSelectRow(context, selected2.value, "选择年月"),
                  onTap: () {
                    TDPicker.showMultiPicker(context, onConfirm: (selected) {
                      selected2.value =
                          date2[0][selected[0]] + date2[1][selected[1]];
                    }, data: date2);
                  },
                )),
            Obx(() =>
                GestureDetector(
                  child: buildSelectRow(context, selected3.value, "选择年月日"),
                  onTap: () {
                    TDPicker.showDatePicker(
                        context, title: "选择年月日", onConfirm: (selected) {
                      selected3.value = "${selected["year"].toString().padLeft(4,"0")}-${selected["month"].toString().padLeft(2,"0")}-${selected["day"].toString().padLeft(2,"0")}";
                    },dateStart: [2020,01,01],dateEnd: [2025,12,31],initialDate: [2023,10,01]);
                  },
                )),
            Obx(() =>
                GestureDetector(
                  child: buildSelectRow(context, selected4.value, "选择时分秒"),
                  onTap: () {
                    TDPicker.showDatePicker(
                        context, title: "选择时分秒", onConfirm: (selected) {
                      selected3.value = "${selected["hour"].toString().padLeft(2,"0")}-${selected["minute"].toString().padLeft(2,"0")}-${selected["second"].toString().padLeft(2,"0")}";
                    },dateStart: [2020,01,01],dateEnd: [2025,12,31],initialDate: [2023,10,01],useYear: false,useMonth: false,useDay: false,useHour: true,useMinute: true,useSecond: true);
                  }
                )),
            Obx(() =>
                GestureDetector(
                  child: buildSelectRow(context, selected5.value, "选择地区(三级联动)"),
                  onTap: () {
                    TDPicker.showMultiLinkedPicker(context, title:"三级联动",onConfirm: (selected){
                      selected5.value = '${selected[0]} ${selected[1]} ${selected[2]}';
                    }, data: data5, columnNum: 3, initialData: ["香港","香港","九龙城区"]);
                  },
                ))
          ],
        ));
  }

  Widget buildSelectRow(BuildContext context, String output, String title) {
    return Container(
      color: TDTheme
          .of(context)
          .whiteColor1,
      height: 56,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
                child: TDText(
                  title,
                  font: TDTheme
                      .of(context)
                      .fontBodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  children: [
                    TDText(
                      output,
                      font: TDTheme
                          .of(context)
                          .fontBodyMedium,
                      textColor:
                      TDTheme
                          .of(context)
                          .fontGyColor3
                          .withOpacity(0.4),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Icon(
                        TDIcons.chevron_right,
                        color:
                        TDTheme
                            .of(context)
                            .fontGyColor3
                            .withOpacity(0.4),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const TDDivider(margin: EdgeInsets.only(left: 12, right: 12))
        ],
      ),
    );
  }
}
