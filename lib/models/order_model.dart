import 'package:arfudy_flutter/models/order_item_model.dart';

class OrderModel {
  final String id;
  final String serviceId;
  final OrderItemModel product;
  final String clientName;
  final int tableNum;

  OrderModel({
    required this.id,
    required this.serviceId,
    required this.product,
    required this.clientName,
    required this.tableNum,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      serviceId: json['serviceId'],
      product: OrderItemModel.fromJson(json['product']),
      clientName: json['clientName'],
      tableNum: json['tableNum'],
    );
  }

  @override
  String toString() {
    return 'OrderModel{id: $id, serviceId: $serviceId, product: $product, clientName: $clientName, tableNum: $tableNum}';
  }
}
