import 'package:arfudy_flutter/delegate/arfudy_views_routes.dart';
import 'package:arfudy_flutter/models/client_model.dart';
import 'package:arfudy_flutter/models/service_model.dart';
import 'package:arfudy_flutter/repositories/client_repository.dart';
import 'package:arfudy_flutter/services/error/exceptions.dart';
import 'package:arfudy_flutter/services/gateway.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../models/active_table_model.dart';
import '../services/core_http_client.dart';

class EnteringTableViewController extends GetxController with StateMixin {
  late final ActiveTableModel table;

  final clients = <ClientModel>[];

  final _gateway = Get.find<IHttpClient>();
  late Dio dio = Dio();
  final clientRepository = Get.find<ClientRepository>();

  final TextEditingController nameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    table = Get.arguments as ActiveTableModel;
  }

  getServiceClientsInfo(String serviceId) async {
    try {
      final response = await GatewayHandler.call<ServiceModel>(
        requisitionCallback: () => _gateway.get('/services/$serviceId'),
        onSuccessCallback: (data) => ServiceModel.fromJson(data["data"]),
        exception: GetServiceException(),
      );
      return response;
    } catch (e) {
      print(e);
    }
  }

  initService() async {
    try {
      final response = await GatewayHandler.call<ServiceModel>(
        requisitionCallback: () => _gateway.post(
          '/services',
          data: buildInitServiceData(),
          isFormData: false,
          printData: true,
        ),
        onSuccessCallback: (data) => ServiceModel(
          id: data["id"],
          serviceToken: data["token"],
          tableId: table.id,
          tableToken: table.activeToken,
          hasEnded: false,
          clients: (data["clients"] as List)
              .map((e) => ClientModel.fromJson(e))
              .toList(),
        ),
        exception: InitServiceException(),
      );

      goToMeals(response);
    } catch (e) {
      e as NewCoreException;

      if (e.statusCode == 409) {
        joinService();
      }
    }
  }

  joinService() async {
    try {
      // final response = await GatewayHandler.call<ServiceModel>(
      //   requisitionCallback: () => _gateway.post(
      //     '/services/${table.activeToken}',
      //     data: buildJoinServiceData(),
      //     isFormData: false,
      //   ),
      //   onSuccessCallback: (data) {
      //     print('entrou no sucesso do join $data');
      //     print(data);
      //     print('clientes ${clientRepository.service.value!.clients}');
      //     clientRepository.service.value!.clients.add(ClientModel(
      //       name: nameController.text,
      //       token: data["clientToken"],
      //       isAdmin: false,
      //     ));
      //     print('clientes ${clientRepository.service.value!.clients}');
      //     return ServiceModel(
      //       id: data["serviceId"],
      //       serviceToken: data["serviceToken"],
      //       tableId: table.id,
      //       tableToken: table.activeToken,
      //       clients: clientRepository.service.value!.clients,
      //       hasEnded: false,
      //     );
      //   },
      //   exception: InitServiceException(),
      // );

      final response = await dio.post(
        'https://arfudy-nestjs-backend.onrender.com/api/services/${table.activeToken}',
        data: buildJoinServiceData(),
      );
      if (response.statusCode == 201) {
        final data = response.data["data"];

        final service = ServiceModel(
          id: data["serviceId"] as String,
          serviceToken: data["serviceToken"] as String,
          tableId: table.id,
          tableToken: table.activeToken,
          clients: [
            ClientModel(
              name: nameController.text,
              token: data["clientToken"] as String,
              isAdmin: false,
            ),
          ],
          hasEnded: false,
        );

        goToMeals(service);
      }
    } catch (e) {
      print(e);
    }
  }

  void goToMeals(ServiceModel service) async {
    final completeService = await getServiceClientsInfo(service.id);

    clientRepository.setService(completeService, nameController.text);
    Get.offAllNamed(ArfudyRoutes.meals);
  }

  buildInitServiceData() {
    return {
      "tableToken": table.activeToken.toString(),
      "tableId": table.id.toString(),
      "client": {
        "name": nameController.text,
        "isAdmin": true,
      }
    };
  }

  buildJoinServiceData() {
    return {
      "client": {"name": nameController.text}
    };
  }
}
