import 'package:arfudy_flutter/services/gateway.dart';
import 'package:get/get.dart';

import '../models/active_table_model.dart';
import '../services/core_http_client.dart';
import '../services/error/exceptions.dart';

enum ArfudyBasicState { loaded, error, loading }

class TablesQrCodeTestViewController extends GetxController with StateMixin {
  final String lol = 'TablesQrCodeTestViewController';

  IHttpClient get _gateway => Get.find<IHttpClient>();
  List<ActiveTableModel> _tables = [];

  List<ActiveTableModel> get tables => _tables;

  @override
  void onInit() async {
    super.onInit();
    change(null, status: RxStatus.loading());
    await getTablesService();
  }

  //SERVICES
  getTablesService() async {
    try {
      change(null, status: RxStatus.loading());
      final result = await GatewayHandler.call<List<ActiveTableModel>>(
        requisitionCallback: () => _gateway.get('/tables'),
        onSuccessCallback: (data) => (data['data'] as List).map((item) => ActiveTableModel.fromJson(item)).toList(),
        exception: GetTablesException(),
        printResult: true,
      );
      _tables = result;
      change(null, status: RxStatus.success());
    } catch (e) {
      e as NewCoreException;
      change(null, status: RxStatus.error(e.failureMessages.isNotEmpty ? e.failureMessages.first : e.label));
    }
  }
}
