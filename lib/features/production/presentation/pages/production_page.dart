// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../widgets/production_body.dart';

class ProductionPage extends StatelessWidget {
  const ProductionPage({super.key, required this.categoryName});
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return ProductionBody(
      categoryName: categoryName,
    );
  }
}
