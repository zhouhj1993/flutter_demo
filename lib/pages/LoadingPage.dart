import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final title = Get.parameters["title"] ?? "";
    return ContainerView(
        title: title,
        body: Column(
          children: [
            const SizedBox(height: 10),
            TDLoading(
              size: TDLoadingSize.medium,
              icon: TDLoadingIcon.circle,
              iconColor: TDTheme.of(context).brandNormalColor,
            ),
            const SizedBox(height: 10),
            TDLoading(
              size: TDLoadingSize.medium,
              icon: TDLoadingIcon.activity,
              iconColor: TDTheme.of(context).brandNormalColor,
            ),
            const SizedBox(height: 10),
            TDLoading(
              size: TDLoadingSize.medium,
              icon: TDLoadingIcon.point,
              iconColor: TDTheme.of(context).brandNormalColor,
            ),
            const SizedBox(height: 10),
            TDLoading(
              size: TDLoadingSize.medium,
              icon: TDLoadingIcon.circle,
              iconColor: TDTheme.of(context).brandNormalColor,
              text: "加载中",
              axis: Axis.vertical,
              refreshWidget: GestureDetector(
                child: TDText(
                  '刷新',
                  font: TDTheme.of(context).fontBodySmall,
                  textColor: TDTheme.of(context).brandNormalColor,
                ),
                onTap: () {
                  TDToast.showSuccess("成功文案",
                      context: context,
                      direction: IconTextDirection.horizontal,
                      duration: const Duration(milliseconds: 500));
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ));
  }
}
