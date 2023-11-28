class OrderItemModel {
  final String id;
  final String name;
  final int quantity;
  final String status;

  OrderItemModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.status,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'],
      name: json['name'],
      quantity: int.parse(json['quantity'].toString()),
      status: json['status'],
    );
  }

  @override
  String toString() {
    return 'ProductModel{id: $id, name: $name, quantity: $quantity, status: $status}';
  }

  String toStringTableSituation() {
    return '${quantity}x $name';
  }
}
