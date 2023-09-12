import 'package:arfudy_flutter/delegate/arfudy_views_routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class GlobalModule {
  static inject() {}

  static List<GetPage<dynamic>> get routes => _routes;

  static final List<GetPage<dynamic>> _routes = [
    ...ArfudyViews.views,
  ];
}
