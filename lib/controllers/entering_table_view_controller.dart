import 'package:get/get.dart';

import '../models/active_table_model.dart';

class EnteringTableViewController extends GetxController {
  late final ActiveTableModel table;

  @override
  void onInit() {
    super.onInit();
    table = Get.arguments as ActiveTableModel;
  }
}
