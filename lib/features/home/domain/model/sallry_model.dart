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

  static Map<dynamic, dynamic> tojson({required salesModel sales}) {
    return {
      "sallary": sales.sales,
      "salesdate": sales.salesDate.toString(),
      "orderid": sales.orderId,
      "notes": sales.notes,
      "clientName": sales.clientName
    };
  }

  factory salesModel.fromjson({required Map<dynamic, dynamic> json}) {
    return salesModel(
        sales: 5,
        //json['sallary'],
        salesDate: DateTime(2024, 3, 3),
        orderId: json['orderid'],
        notes: json['notes'],
        clientName: json['clientName']);
  }
}
