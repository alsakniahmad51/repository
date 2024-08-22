// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductionTableSell extends StatelessWidget {
  const ProductionTableSell({
    super.key,
    required this.index,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width / 4.1;
    return Container(
      height: 40.h,
      width: width,
      decoration: BoxDecoration(border: Border.all()),
      child: Text("data:$index"),
    );
  }
}
