import 'package:flutter_demo/pages/ButtonPage.dart';
import 'package:flutter_demo/pages/DividerPage.dart';
import 'package:flutter_demo/pages/InputPage.dart';
import 'package:flutter_demo/pages/LinkPage.dart';
import 'package:flutter_demo/pages/PickerPage.dart';
import 'package:flutter_demo/pages/TabBarPage.dart';
import 'package:flutter_demo/pages/TabsPage.dart';
import 'package:flutter_demo/pages/TetxtPage.dart';
import 'package:get/get.dart';
import 'NotFoundRoute.dart';
import 'RouteModel.dart';

class AppPages {
  static const initialRoute = "/";
  static final notFoundPage =
      GetPage(name: "/404", page: () => const NotFoundRoute());

  static final pages =
      routeModel.map((e) => GetPage(name: e.routeUrl, page: e.page)).toList();

  static List<RouteModel> routeModel = [
    RouteModel(
        routeUrl: "/button",
        routeName: "Button 按钮",
        page: () => const ButtonPage()),
    RouteModel(
        routeUrl: "/divider",
        routeName: "Divider 分割线",
        page: () => const DividerPage()),
    RouteModel(
        routeUrl: "/link",
        routeName: "Link 链接",
        page: () => const LinkPage()),
    RouteModel(
        routeUrl: "/text",
        routeName: "Text 文本",
        page: () => const TextPage()),
    RouteModel(
        routeUrl: "/tabBar",
        routeName: "TabBar 标签栏",
        page: () => TabBarPage()),
    RouteModel(
        routeUrl: "/tabs",
        routeName: "Tabs 选项卡",
        page: () => TabsPage()),
    RouteModel(
        routeUrl: "/picker",
        routeName: "Picker 选项器",
        page: () => PickerPage()),
    RouteModel(
        routeUrl: "/input",
        routeName: "Input 输入框",
        page: () => const InputPage())
  ];
}
