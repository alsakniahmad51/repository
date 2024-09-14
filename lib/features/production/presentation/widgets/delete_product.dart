import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteProduct extends StatelessWidget {
  const DeleteProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(12.r),
              bottomRight: Radius.circular(12.r))),
      height: 185.h,
      width: 40.w,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}
