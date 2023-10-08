import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

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
              ///不可点击的按钮
              const TDButton(
                margin: EdgeInsets.symmetric(vertical: 6),
                text: "禁用状态",
                disabled: true,
                theme: TDButtonTheme.primary,
              ),

              ///添加点击事件的通栏按钮
              TDButton(
                  text: "可用状态",
                  isBlock: true,
                  theme: TDButtonTheme.primary,
                  onTap: () => TDToast.showSuccess("成功", context: context)),

              ///图标按钮
              const TDButton(
                  icon: TDIcons.app,
                  theme: TDButtonTheme.primary,
                  margin: EdgeInsets.symmetric(vertical: 6)),

              ///加载按钮
              TDButton(
                iconWidget: TDLoading(
                  size: TDLoadingSize.small,
                  icon: TDLoadingIcon.circle,
                  iconColor: TDTheme.of(context).whiteColor1,
                ),
                text: "加载中",
                theme: TDButtonTheme.primary,
              ),

              ///组合按钮
              Container(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: const Row(
                  children: [
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TDButton(
                      text: '填充按钮',
                      theme: TDButtonTheme.light,
                    )),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        child: TDButton(
                      text: '填充按钮',
                      theme: TDButtonTheme.primary,
                    )),
                    SizedBox(
                      width: 16,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
