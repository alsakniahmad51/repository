// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:repository/core/functions/show_bottom_sheet.dart';
import 'package:repository/features/production/presentation/widgets/bottom_sheet_body_production.dart';
import 'package:flutter/material.dart';

import '../widgets/production_body.dart';

class ProductionPage extends StatelessWidget {
  const ProductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: const Text(
          "اسم الصنف",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            ShowBottomSheet.showBottomSheet(context,
                child: const BottomSheetBodyProduction(), initSize: 0.6);
          }),
      body: const SafeArea(child: ProductionBody()),
    );
  }
}
