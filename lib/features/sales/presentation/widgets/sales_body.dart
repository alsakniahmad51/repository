import 'package:repository/core/functions/show_bottom_sheet.dart';
import 'package:repository/features/sales/presentation/widgets/bottom_sheet_sales_body.dart';
import 'package:flutter/material.dart';

import 'build_customer_list_tile.dart';

class SalesBody extends StatelessWidget {
  const SalesBody({super.key});

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
                child: const BottomSheetBodySales(), initSize: 0.6);
          }),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return buildCustomerListTile(
                name: 'John Doe',
                quantity: 5,
                invoiceNumber: '123456',
                saleDate: DateTime(2024, 5, 3),
                notes: '');
          },
          padding: const EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}
