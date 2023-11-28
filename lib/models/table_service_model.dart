import 'package:arfudy_flutter/models/order_item_model.dart';

class TableServiceModel {
  final String id;
  final String serviceId;
  final OrderItemModel product;
  final String clientName;
  final int tableNum;

  TableServiceModel({
    required this.id,
    required this.serviceId,
    required this.product,
    required this.clientName,
    required this.tableNum,
  });

  factory TableServiceModel.fromJson(Map<String, dynamic> json) =>
      TableServiceModel(
        id: json["id"],
        serviceId: json["serviceId"],
        product: OrderItemModel.fromJson(json["product"]),
        clientName: json["clientName"],
        tableNum: int.parse(json["tableNum"].toString()),
      );

  @override
  String toString() {
    return 'TableServiceModel{id: $id, serviceId: $serviceId, product: $product, clientName: $clientName, tableNum: $tableNum}';
  }
}
