import 'package:flutter/material.dart';
import 'package:flutter_demo/pages/ButtonPage.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class DialogPage extends StatelessWidget {
  DialogPage({super.key});

  final _dialogTitle = '对话框标题';
  final _commonContent = '告知当前状态、信息和解决方法，等内容。描述尽可能控制在三行内。';
  final _demoImage = Image.asset(
    'images/image.png',
  );

  @override
  Widget build(BuildContext context) {
    final title = Get.parameters["title"] ?? "";
    return ContainerView(
        title: title,
        body: Column(
          children: [
            const SizedBox(height: 10),
            _buildDialogItem(
              context,
              "反馈类",
              TDConfirmDialog(
                title: _dialogTitle,
                content: _commonContent,
              ),
            ),
            const SizedBox(height: 10),
            _buildDialogItem(
              context,
              "确认类",
              TDAlertDialog(
                title: _dialogTitle,
                content: _commonContent,
                showCloseButton: true,
              ),
            ),
            const SizedBox(height: 10),
            _buildDialogItem(
              context,
              "输入类",
              TDInputDialog(
                hintText: "请输入内容",
                textEditingController: TextEditingController(),
                title: _dialogTitle,
                content: _commonContent,
              ),
            ),
            const SizedBox(height: 10),
            _buildDialogItem(
              context,
              "图片类",
              TDImageDialog(
                image: _demoImage,
                imagePosition: TDDialogImagePosition.middle,
                title: _dialogTitle,
                content: _commonContent,
              ),
            )
          ],
        ));
  }

  Widget _buildDialogItem(BuildContext context, String title, Widget dialog) {
    return TDButton(
      text: title,
      theme: TDButtonTheme.primary,
      type: TDButtonType.outline,
      onTap: () {
        showGeneralDialog(
            context: context,
            pageBuilder: (BuildContext buildContext, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return dialog;
            });
      },
    );
  }
}
