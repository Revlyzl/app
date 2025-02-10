class ProductionOrder {
  final String materialName;
  final String materialCode;
  final String shift;
  final String plantName;

  ProductionOrder({
    required this.materialName,
    required this.materialCode,
    required this.shift,
    required this.plantName,
  });

  factory ProductionOrder.fromJson(Map<String, dynamic> json) {
    return ProductionOrder(
      materialName: json['MATERIALNAME'] ?? '-',
      materialCode: json['MATERIALCODE'] ?? '-',
      shift: json['SHIFT'] ?? '-',
      plantName: json['PLANTNAME'] ?? '-',
    );
  }
}
