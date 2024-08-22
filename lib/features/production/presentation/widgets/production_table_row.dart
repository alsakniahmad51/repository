// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'production_table_sell.dart';

class ProductionTableRow extends StatelessWidget {
  const ProductionTableRow({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProductionTableSell(index: index),
        ProductionTableSell(index: index),
        ProductionTableSell(index: index),
        ProductionTableSell(index: index),
      ],
    );
  }
}
