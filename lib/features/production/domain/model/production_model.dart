class ProductionModel {
  final String? notes;
  final double? weight;
  final DateTime date;
  final int count;

  ProductionModel(
      {required this.notes,
      required this.weight,
      required this.date,
      required this.count});

  static Map<dynamic, dynamic> tojson({required ProductionModel production}) {
    return {
      "notes": production.notes,
      "weight": production.weight,
      "date": production.date.toString(),
      "count": production.count
    };
  }

  factory ProductionModel.fromjson({required Map<dynamic, dynamic> json}) {
    return ProductionModel(
        notes: json['notes'],
        weight: 2,
        //json['weight'],
        date: DateTime(2024),
        // json['date'],
        count: json['count']);
  }
}
