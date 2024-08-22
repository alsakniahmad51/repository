import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      key: const Key("a"),
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.r),
      elevation: 6,
      shadowColor: Colors.black,
      child: SizedBox(
        width: 320.w,
        child: TextField(
          cursorHeight: 20.h,
          cursorColor: Colors.black,
          style: TextStyle(height: 1.2.h),
          decoration: InputDecoration(
              isDense: true,
              prefix: SizedBox(
                width: 5.w,
              ),
              prefixIconConstraints: BoxConstraints.loose(Size(50.w, 35.h)),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Icon(Icons.search),
              ),
              border: buildOutlineInputBorder(),
              enabledBorder: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder()),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: const BorderSide(color: Colors.white));
  }
}
