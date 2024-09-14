import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:repository/features/production/presentation/widgets/custom_alert_dialog.dart';
import 'package:repository/features/production/presentation/widgets/delete_product.dart';
import 'package:repository/features/production/presentation/widgets/product_list_tile_body.dart';

Widget buildProductListTile(
    {required BuildContext context,
    required double quantity,
    required List production,
    required double wight,
    required int index,
    required String refrens,
    required DateTime productionDate,
    required String notes}) {
  DatabaseReference ref = FirebaseDatabase.instance.ref("$refrens/production");
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Slidable(
      startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const StretchMotion(),
          children: [
            Expanded(
              child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return CustomAlertDialog(
                          ref: ref,
                          production: production,
                          index: index,
                        );
                      },
                    );
                  },
                  child: const DeleteProduct()),
            )
          ]),
      child: ProductListTileBody(quantity, productionDate, wight, notes),
    ),
  );
}
