extension FormatReal on String {
  String toReal() =>
      "R\$ ${double.tryParse(this)?.toStringAsFixed(2).replaceAll('.', ',')}";
}
