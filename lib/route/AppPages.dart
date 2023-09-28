import 'package:flutter_demo/pages/ButtonPage.dart';
import 'package:get/get.dart';
import 'NotFoundRoute.dart';
import 'RouteModel.dart';

class AppPages {
  static const initialRoute = "/";
  static final notFoundPage =
      GetPage(name: "/404", page: () => const NotFoundRoute());

  static const buttonPage = "/button";

  static final pages =
      routeModel.map((e) => GetPage(name: buttonPage, page: e.page)).toList();

  static List<RouteModel> routeModel = [
    RouteModel(
        routeUrl: buttonPage,
        routeName: "button",
        page: () => const ButtonPage())
  ];
}
