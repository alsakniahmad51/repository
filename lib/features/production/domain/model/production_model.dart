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

  static Map<String, dynamic> tojson({required ProductionModel production}) {
    return {
      "notes": production.notes,
      "weight": production.weight,
      "date": production.date.toString(),
      "count": production.count
    };
  }
}
