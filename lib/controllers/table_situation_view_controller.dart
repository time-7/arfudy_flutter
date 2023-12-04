import 'package:arfudy_flutter/delegate/arfudy_views_routes.dart';
import 'package:arfudy_flutter/models/order_item_model.dart';
import 'package:arfudy_flutter/models/table_service_model.dart';
import 'package:arfudy_flutter/repositories/client_repository.dart';
import 'package:arfudy_flutter/services/gateway.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../services/core_http_client.dart';
import '../services/error/exceptions.dart';

class TableSituationViewController extends GetxController
    with StateMixin<Map<String, List<OrderItemModel>>> {
  final RxMap<String, List<OrderItemModel>> orders =
      <String, List<OrderItemModel>>{}.obs;

  final RxBool isEndingService = false.obs;

  final _gateway = Get.find<IHttpClient>();
  final clientRepository = Get.find<ClientRepository>();
  late Dio dio = Dio();

  @override
  onInit() {
    super.onInit();
    getOrders();
  }

  getOrders() async {
    change({}, status: RxStatus.loading());
    try {
      final response = await GatewayHandler.call<List<List<TableServiceModel>>>(
        requisitionCallback: () => _gateway.get(
          '/orders/table/${clientRepository.service.value!.tableId}',
        ),
        onSuccessCallback: (data) => (data['data'] as List)
            .map(
              (e) => (e as List)
                  .map((e) => TableServiceModel.fromJson(e))
                  .toList(),
            )
            .toList(),
        exception: GetOrdersNewException(),
      );
      if (response.isEmpty) {
        change(null, status: RxStatus.empty());
        return;
      }
      Map<String, List<OrderItemModel>> clientProductsMap = {};

      for (List<TableServiceModel> clientDataList in response) {
        for (TableServiceModel tableService in clientDataList) {
          String clientName = tableService.clientName;
          if (!clientProductsMap.containsKey(clientName)) {
            clientProductsMap[clientName] = [];
          }
          clientProductsMap[clientName]?.add(tableService.product);
        }
      }

      orders.value = clientProductsMap;
      change(clientProductsMap, status: RxStatus.success());
    } catch (e) {
      print(e);
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  endService() async {
    isEndingService.value = true;
    try {
      // final response = await GatewayHandler.call<String>(
      //   requisitionCallback: () => _gateway.post(
      //     '/services/end/${clientRepository.service.value.id}',
      //     // '/services/end/6560b1f61554114aadc1b634',
      //     headers: getEndServiceHeaders(),
      //   ),
      //   onSuccessCallback: (data) {
      //     print('caiu no sucesso com data $data');
      //     return data['message'];
      //   },
      //   exception: EndServiceException(),
      // );

      final response = await dio.post(
          'https://arfudy-nestjs-backend.onrender.com/api/services/end/${clientRepository.service.value!.id}',
          options: Options(
            headers: getEndServiceHeaders(),
          ));

      if (response.statusCode == 200) {
        clientRepository.endService();

        Get.offAllNamed(ArfudyRoutes.splash);
      }

      isEndingService.value = false;
    } catch (e) {
      print(e);
      isEndingService.value = false;
    }
  }

  Map<String, String> getEndServiceHeaders() {
    return {"clientToken": clientRepository.currentClient.value!.token};
  }
}
