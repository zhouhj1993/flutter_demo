import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class PopupPage extends StatelessWidget {
  const PopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final title = Get.parameters["title"] ?? "";
    return ContainerView(
        title: title,
        body: Column(
          children: [
            const SizedBox(height: 10),
            _buildPopupItem1(context),
            const SizedBox(height: 10),
            _buildPopupItem2(context),
            const SizedBox(height: 10),
            _buildPopupItem3(context),
            const SizedBox(height: 10),
            _buildPopupItem4(context),
          ],
        ));
  }

  Widget _buildPopupItem1(BuildContext context) {
    return TDButton(
      text: "底部弹出",
      theme: TDButtonTheme.primary,
      type: TDButtonType.outline,
      onTap: () {
        Navigator.of(context).push(TDSlidePopupRoute(
            slideTransitionFrom: SlideTransitionFrom.bottom,
            builder: (context) {
              return Container(
                height: 280,
                color: Colors.white,
              );
            }));
      },
    );
  }

  Widget _buildPopupItem2(BuildContext context) {
    return TDButton(
        text: "底部弹出带操作",
        theme: TDButtonTheme.primary,
        type: TDButtonType.outline,
        onTap: () {
          Navigator.of(context).push(TDSlidePopupRoute(builder: (context) {
            return TDPopupBottomConfirmPanel(
              child: Container(height: 280),
              leftClick: () {
                Navigator.pop(context);
              },
              rightClick: () {
                TDToast.showText("点击确定", context: context);
                Navigator.pop(context);
              },
            );
          }));
        });
  }

  Widget _buildPopupItem3(BuildContext context) {
    return TDButton(
        text: "底部弹出带关闭",
        theme: TDButtonTheme.primary,
        type: TDButtonType.outline,
        onTap: () {
          Navigator.of(context).push(TDSlidePopupRoute(
              slideTransitionFrom: SlideTransitionFrom.bottom,
              builder: (context) {
                return TDPopupBottomDisplayPanel(
                  child: Container(height: 280),
                  closeClick: () {
                    Navigator.pop(context);
                  },
                );
              }));
        });
  }

  Widget _buildPopupItem4(BuildContext context) {
    return TDButton(
        text: "中间弹出带关闭",
        theme: TDButtonTheme.primary,
        type: TDButtonType.outline,
        onTap: () {
          Navigator.of(context).push(TDSlidePopupRoute(
              slideTransitionFrom: SlideTransitionFrom.center,
              builder: (context) {
                return TDPopupCenterPanel(
                  closeUnderBottom: true,
                  child: const SizedBox(height: 280, width: 280),
                  closeClick: () {
                    Navigator.pop(context);
                  },
                );
              }));
        });
  }
}
