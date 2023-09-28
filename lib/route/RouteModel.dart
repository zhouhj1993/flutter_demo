import 'package:get/get.dart';

class RouteModel {
  String routeUrl;
  String routeName;
  GetPageBuilder page;

  RouteModel(
      {required this.routeUrl, required this.routeName, required this.page});
}
