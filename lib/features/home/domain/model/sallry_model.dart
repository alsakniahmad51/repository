class salesModel {
  final int sales;
  final DateTime salesDate;
  final int orderId;
  final String? notes;
  final String clientName;

  salesModel(
      {required this.sales,
      required this.salesDate,
      required this.orderId,
      required this.notes,
      required this.clientName});

  static Map<String, dynamic> tojson({required salesModel sales}) {
    return {
      "sales": sales.sales,
      "salesdate": sales.salesDate.toString(),
      "orderid": sales.orderId,
      "notes": sales.notes,
      "clientName": sales.clientName
    };
  }
}
