import 'package:arfudy_flutter/controllers/food_view_controller.dart';
import 'package:arfudy_flutter/controllers/meals_view_controller.dart';
import 'package:arfudy_flutter/controllers/table_situation_view_controller.dart';
import 'package:arfudy_flutter/repositories/client_repository.dart';
import 'package:get/get.dart';

import '../controllers/entering_table_view_controller.dart';
import '../controllers/tables_qr_code_test_view_controller.dart';

class ArfudyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TablesQrCodeTestViewController>(() => TablesQrCodeTestViewController(), fenix: true);
    Get.lazyPut<EnteringTableViewController>(() => EnteringTableViewController(), fenix: true);
    Get.lazyPut<MealsViewController>(() => MealsViewController(), fenix: true);
    Get.lazyPut<TableSituationViewController>(() => TableSituationViewController(), fenix: true);
    Get.put<ClientRepository>(ClientRepository(), permanent: true);
    Get.lazyPut<FoodViewController>(() => FoodViewController(), fenix: true);
  }
}
