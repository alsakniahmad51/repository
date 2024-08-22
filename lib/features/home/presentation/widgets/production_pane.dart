// ignore: depend_on_referenced_packages

import 'dart:developer';
import 'package:repository/core/functions/navigator.dart';
import 'package:repository/features/production/presentation/pages/production_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ProductionPane extends StatelessWidget {
  const ProductionPane({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      // borderRadius: BorderRadius.circular(22),
      label: "إنتاج",
      icon: Icons.add,
      backgroundColor: Colors.blue,
      onPressed: (context) {
        MovingNavigator.navToPage(
            context: context, page: const ProductionPage());
        log("انتاج");
      },
    );
  }
}
