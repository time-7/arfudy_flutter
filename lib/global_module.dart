import 'package:arfudy_flutter/delegate/arfudy_views_routes.dart';
import 'package:arfudy_flutter/services/core_http_client.dart';
import 'package:get/get.dart';

class GlobalModule {
  static inject() {
    Get.put<IHttpClient>(CoreHttpClient());
  }

  static List<GetPage<dynamic>> get routes => _routes;

  static final List<GetPage<dynamic>> _routes = [
    ...ArfudyViews.views,
  ];
}
