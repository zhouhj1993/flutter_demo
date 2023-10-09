import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final editingController = TextEditingController();
  Timer? _timer;
  int _countdownTime = 0;

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  void _startCountdownTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_countdownTime < 1) {
          _timer?.cancel();
        } else {
          _countdownTime -= 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = Get.parameters["title"] ?? "";
    return ContainerView(
        backgroundColor: Colors.grey.shade200,
        title: title,
        body: Column(
          children: [
            TDInput(
              leftLabel: '标签',
              controller: editingController,
              backgroundColor: Colors.white,
              hintText: '请输入文字',
              required: true,
              obscureText: true,
              onChanged: (text) {
                setState(() {});
              },
              onClearTap: () {
                editingController.clear();
                setState(() {});
              },
            ),
            TDInput(
                backgroundColor: Colors.white,
                inputType: TextInputType.number,
                leftLabel: "单价",
                required: true,
                needClear: false,
                hintText: "0.00",
                textAlign: TextAlign.end,
                type: TDInputType.special,
                rightWidget: TDText(
                  "元",
                  textColor: TDTheme.of(context).fontGyColor1,
                )),
            TDInput(
              backgroundColor: Colors.white,
              inputType: TextInputType.phone,
              leftLabel: "手机号",
              hintText: "输入手机号",
              rightBtn: SizedBox(
                width: 97.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Container(
                        width: 0.5,
                        height: 24,
                        color: TDTheme.of(context).grayColor3,
                      ),
                    ),
                    _countdownTime > 0
                        ? TDText(
                            "重发($_countdownTime秒)",
                            textColor: TDTheme.of(context).fontGyColor3,
                          )
                        : TDText(
                            "发送验证码",
                            textColor: TDTheme.of(context).brandNormalColor,
                          )
                  ],
                ),
              ),
              onBtnTap: () {
                if (_countdownTime == 0) {
                  TDToast.showText('点击了发送验证码', context: context);
                  setState(() {
                    _countdownTime = 60;
                  });
                  _startCountdownTimer();
                }
              },
            ),
            TDInput(
              controller: editingController,
              hintText: "这是一串很厂很长的文字",
              backgroundColor: Colors.white,
              type: TDInputType.longText,
              onChanged: (text){
                setState(() {

                });
              },
            )
          ],
        ));
  }
}
