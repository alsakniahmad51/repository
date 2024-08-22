import 'package:repository/features/production/domain/model/production_model.dart';
import 'package:repository/features/home/domain/model/sallry_model.dart';

class MainModel {
  final String name;
  final salesModel sales;
  final ProductionModel production;

  MainModel(
      {required this.name, required this.sales, required this.production});
  Map<String, dynamic> tojson() {
    return {
      "sales": salesModel.tojson(sales: sales),
      "production": ProductionModel.tojson(production: production)
    };
  }
}
