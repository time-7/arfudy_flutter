import 'package:arfudy_flutter/models/client_model.dart';
import 'package:arfudy_flutter/models/service_model.dart';
import 'package:get/get.dart';

class ClientRepository {
  // final Rxn<ClientModel> currentClient = Rxn<ClientModel>();
  final Rx<ClientModel> currentClient = ClientModel(
    name: 'Julia',
    isAdmin: true,
    token: 'aacf6327-89e9-4292-b42a-7ac422adb503',
  ).obs;

  final Rx<ServiceModel> service = ServiceModel(
    id: '655f904edede47fd704ee280',
    tableId: '655f8c15dede47fd704ee27f',
    tableToken: '55397369-2ab9-457b-a494-3d5a6523bceb',
    serviceToken: 'd7573176-53d9-4a20-b887-20d735b92e6d',
    hasEnded: false,
    clients: [
      ClientModel(
        name: 'Julia',
        isAdmin: true,
        token: 'aacf6327-89e9-4292-b42a-7ac422adb503',
      ),
      ClientModel(
        name: 'Ana',
        token: '828b299e-aa96-4433-802a-0bcdd712fb09',
        isAdmin: false,
      ),
    ],
  ).obs;

  setClient(ClientModel client) {
    currentClient.value = client;
  }
}
