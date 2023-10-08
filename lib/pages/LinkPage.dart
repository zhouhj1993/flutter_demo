import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/ContainerView.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';

class LinkPage extends StatelessWidget {
  const LinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    String title = Get.parameters["title"] ?? "";
    return ContainerView(
        title: title,
        body: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLinkWithStyleAndState(
                        TDLinkStyle.primary, TDLinkState.normal),
                    _buildLinkWithStyleAndState(
                        TDLinkStyle.warning, TDLinkState.normal),
                    _buildLinkWithStyleAndState(
                        TDLinkStyle.danger, TDLinkState.normal),
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLinkWithStyleAndState(
                        TDLinkStyle.primary, TDLinkState.active),
                    _buildLinkWithStyleAndState(
                        TDLinkStyle.warning, TDLinkState.active),
                    _buildLinkWithStyleAndState(
                        TDLinkStyle.danger, TDLinkState.active),
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(top: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildLinkWithStyleAndState(
                        TDLinkStyle.primary, TDLinkState.disabled),
                    _buildLinkWithStyleAndState(
                        TDLinkStyle.warning, TDLinkState.disabled),
                    _buildLinkWithStyleAndState(
                        TDLinkStyle.danger, TDLinkState.disabled),
                  ],
                ))
          ],
        ));
  }

  TDLink _buildLinkWithStyleAndState(TDLinkStyle style, TDLinkState state) {
    return TDLink(
        label: "跳转链接",
        style: style,
        state: state,
        type: TDLinkType.withPrefixIcon,
        size: TDLinkSize.medium);
  }
}
