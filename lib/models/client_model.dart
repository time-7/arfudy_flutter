class ClientModel {
  final String name;
  final String token;
  final bool isAdmin;

  ClientModel({
    required this.name,
    required this.token,
    required this.isAdmin,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        name: json["name"],
        token: json["clientToken"],
        isAdmin: json["isAdmin"],
      );

  @override
  String toString() {
    return 'ClientModel{name: $name, token: $token, isAdmin: $isAdmin}';
  }
}
