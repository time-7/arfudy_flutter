import 'package:get/get.dart';

import '../controllers/entering_table_view_controller.dart';
import '../controllers/tables_qr_code_test_view_controller.dart';

class ArfudyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TablesQrCodeTestViewController>(() => TablesQrCodeTestViewController(), fenix: true);
    Get.lazyPut<EnteringTableViewController>(() => EnteringTableViewController(), fenix: true);
  }
}
