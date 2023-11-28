import 'package:arfudy_flutter/models/client_model.dart';
import 'package:arfudy_flutter/models/service_model.dart';
import 'package:get/get.dart';

class ClientRepository {
  // final Rxn<ClientModel> currentClient = Rxn<ClientModel>();
  final Rx<ClientModel> currentClient = ClientModel(
    name: 'Isa',
    isAdmin: true,
    token: 'a910f16b-186d-41ed-8836-bc5eba979737',
  ).obs;

  final Rx<ServiceModel> service = ServiceModel(
    id: '6560b1f61554114aadc1b634',
    tableId: '652d8eb326d11b8b2b66b7e8',
    tableToken: 'dd3b3f59-89e3-45c5-8f20-e46010255891',
    serviceToken: '0e84c545-8b30-4e57-a4cc-320d2f59fb0b',
    hasEnded: false,
    clients: [
      ClientModel(
        name: 'Isa',
        isAdmin: true,
        token: 'a910f16b-186d-41ed-8836-bc5eba979737',
      ),
    ],
  ).obs;

  setClient(ClientModel client) {
    currentClient.value = client;
  }
}
