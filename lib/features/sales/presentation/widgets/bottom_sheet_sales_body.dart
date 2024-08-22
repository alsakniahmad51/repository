import 'package:repository/core/widgets/custom_botton.dart';
import 'package:repository/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetBodySales extends StatelessWidget {
  const BottomSheetBodySales({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    return SingleChildScrollView(
      child: Form(
        autovalidateMode: autovalidateMode,
        child: SizedBox(
          height: 730.h,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Column(
              children: [
                SizedBox(
                  width: 360.w,
                  child: const CustomTextField(
                    hint: "اسم الزبون",
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 360.w,
                  child: const CustomTextField(
                    keyboardType: TextInputType.number,
                    hint: "الكمية المباعة",
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 360.w,
                  child: const CustomTextField(
                    keyboardType: TextInputType.datetime,
                    hint: "تاريخ البيع",
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 360.w,
                  child: const CustomTextField(
                    keyboardType: TextInputType.number,
                    hint: "رقم الكشف",
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  width: 360.w,
                  child: const CustomTextField(
                    hint: "الملاحظات",
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: const CustomBotton(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
