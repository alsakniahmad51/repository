// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:repository/features/production/presentation/widgets/build_product_list_tile.dart';
import 'package:repository/features/production/presentation/widgets/production_table_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductionBody extends StatelessWidget {
  const ProductionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.08,
        child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return buildProductListTile(
                quantity: 200,
                wight: 30,
                productionDate: DateTime(2024, 3, 24),
                notes: '');
          },
        ),
      ),
    );
  }
}




/**
 * 
 * 
 * IntrinsicHeight(
            child: Column(
              children: [
                ProductionTableRow(
                  index: index,
                ),
              ],
            ),
          )
 */