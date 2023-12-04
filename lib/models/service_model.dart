import 'package:arfudy_flutter/models/client_model.dart';

class ServiceModel {
  final String id;
  final String serviceToken;
  final String tableId;
  final String tableToken;
  final List<ClientModel> clients;
  final bool hasEnded;

  ServiceModel({
    required this.id,
    required this.serviceToken,
    required this.tableId,
    required this.tableToken,
    required this.clients,
    required this.hasEnded,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
        id: json['id'],
        serviceToken: json['serviceToken'],
        tableId: json['tableId'],
        tableToken: json['tableToken'],
        clients: (json['clients'] as List<dynamic>)
            .map((clientJson) => ClientModel.fromJson(clientJson))
            .toList(),
        hasEnded: json['hasEnded'],
      );

  @override
  String toString() {
    return 'ServiceModel{id: $id, serviceToken: $serviceToken, tableId: $tableId, tableToken: $tableToken, clients: $clients, hasEnded: $hasEnded}';
  }
}
