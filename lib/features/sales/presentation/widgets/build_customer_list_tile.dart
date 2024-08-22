import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCustomerListTile(
    {required String name,
    required double quantity,
    required String invoiceNumber,
    required DateTime saleDate,
    required String notes}) {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Card(
      color: const Color.fromARGB(255, 193, 202, 255),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('اسم الزبون: $name',
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            SizedBox(height: 5.h),
            Text(
                'الكمية المباعة: ${(quantity % 1 == 0) ? quantity.toInt() : quantity}',
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'تاريخ البيع: ${saleDate.year}/${saleDate.month}/${saleDate.day}',
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold)),
            Text('رقم الفاتورة: $invoiceNumber',
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold)),
            if (notes.isNotEmpty)
              Text('ملاحظات: $notes',
                  style: const TextStyle(fontSize: 18, color: Colors.red)),
          ],
        ),
        contentPadding: const EdgeInsets.all(16.0),
      ),
    ),
  );
}

/**
 * 
 * 
 * 
 * 
 * ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: const Color.fromARGB(255, 193, 202, 255),
          child: ListTile(
            subtitleTextStyle: TextStyle(),
            title: const Column(
              children: [
                Text("اسم الزبون"),
                Text("التاريخ"),
                Text(
                  "رقم الكشف",
                  style: TextStyle(color: Colors.black54),
                )
              ],
            ),
            trailing: const Text("540"),
            leading: SizedBox(
                width: 100.w,
                child: Text(
                  "الملاحظات تكت هنا",
                  style: TextStyle(fontSize: 10.sp),
                )),
          ),
        );
      },
    )
 * 
 */