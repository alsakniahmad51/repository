import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildProductListTile(
    {required double quantity,
    required double wight,
    required DateTime productionDate,
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
        title: Text(
            ' الكمية : ${(quantity % 1 == 0) ? quantity.toInt() : quantity}',
            style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                'تاريخ البيع: ${productionDate.year}/${productionDate.month}/${productionDate.day}',
                style: const TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 5.h,
            ),
            Text('الوزن : ${(wight % 1 == 0) ? wight.toInt() : wight}',
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.blue,
                )),
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
