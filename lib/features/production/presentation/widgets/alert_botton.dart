import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertBotton extends StatelessWidget {
  const AlertBotton({
    super.key,
    required this.color,
    required this.text,
    this.onTap,
  });
  final Color? color;
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45.h,
        width: 60.w,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(4.r)),
        child: Center(
          child: Text(
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            text,
          ),
        ));
  }
}
