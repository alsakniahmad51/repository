import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:repository/features/production/presentation/widgets/alert_botton.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    required this.ref,
    required this.production,
    required this.index,
  });
  final DatabaseReference ref;
  final List production;
  final int index;
  @override
  Widget build(BuildContext context) {
    List newData = [];
    for (var element in production) {
      if (element != production[index]) {
        newData.add(element);
      }
    }
    return Center(
        child: Container(
      height: 180.h,
      width: 300.w,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Text(
            "هل تريد الحذف بالتأكيد ؟",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 60.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    await ref.set(newData);
                    Navigator.pop(context);
                  },
                  child: const AlertBotton(
                    text: 'تأكيد',
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const AlertBotton(
                    text: 'إلغاء',
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
