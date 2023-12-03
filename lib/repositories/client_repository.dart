import 'package:arfudy_flutter/models/client_model.dart';
import 'package:arfudy_flutter/models/service_model.dart';
import 'package:get/get.dart';

class ClientRepository {
  final Rxn<ClientModel> currentClient = Rxn<ClientModel>();

  final Rxn<ServiceModel> service = Rxn<ServiceModel>();

  endService() {
    service.value = null;
    currentClient.value = null;
  }

  void setService(ServiceModel newService, String name) {
    service.value = newService;
    currentClient.value = newService.clients.firstWhere(
      (e) => e.name == name,
    );
  }
}
