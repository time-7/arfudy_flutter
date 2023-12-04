class ActiveTableModel {
  final String id;
  final String activeToken;
  final int tableNumber;
  final int seatsNumber;

  ActiveTableModel({
    required this.id,
    required this.activeToken,
    required this.tableNumber,
    required this.seatsNumber,
  });

  factory ActiveTableModel.fromJson(Map<String, dynamic> json) {
    return ActiveTableModel(
      id: json['id'],
      activeToken: json['activeToken'],
      tableNumber: json['tableNum'],
      seatsNumber: json['seatNum'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'activeToken': activeToken,
      'tableNum': tableNumber,
      'seatNum': seatsNumber,
    };
  }

  @override
  String toString() {
    return 'ActiveTableModel{id: $id, activeToken: $activeToken, tableNumber: $tableNumber, seatsNumber: $seatsNumber}';
  }
}
