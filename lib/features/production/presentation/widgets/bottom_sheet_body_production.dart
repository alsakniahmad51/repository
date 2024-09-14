import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/core/widgets/custom_botton.dart';
import 'package:repository/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:repository/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:repository/features/home/presentation/manager/cubit/home_state.dart';

class BottomSheetBodyProduction extends StatelessWidget {
  const BottomSheetBodyProduction(
      {super.key, required this.categoryName, required this.production});
  final String categoryName;
  final List production;

  @override
  Widget build(BuildContext context) {
    TextEditingController countControler = TextEditingController();
    TextEditingController dateControler = TextEditingController();
    TextEditingController? weightControler = TextEditingController();
    TextEditingController notesControler = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Form(
          autovalidateMode: autovalidateMode,
          child: SizedBox(
            height: 700.h,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(top: 10.h, left: 15.w, right: 15.w),
              child: Column(
                children: [
                  SizedBox(
                    width: 360.w,
                    child: CustomTextField(
                      keyboardType: TextInputType.number,
                      controller: countControler,
                      hint: "كمية الإنتاج",
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 360.w,
                    child: CustomTextField(
                      controller: dateControler,
                      keyboardType: TextInputType.number,
                      hint: "التاريخ",
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 360.w,
                    child: CustomTextField(
                      keyboardType: TextInputType.number,
                      controller: weightControler,
                      hint: "الوزن",
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    width: 360.w,
                    child: CustomTextField(
                      controller: notesControler,
                      hint: "الملاحظات",
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: CustomBotton(
                      onTap: () async {
                        if (state is HomeLoaded) {
                          DatabaseReference ref = FirebaseDatabase.instance.ref(
                              "users/${state.idToken}/$categoryName/production/${production.length}");

                          await ref.update({
                            "count": double.parse(countControler.text),
                            "date": "2024-04-05 00:00:00.000",
                            "notes": notesControler.text,
                            "weight": double.parse(weightControler.text == ''
                                ? '0'
                                : weightControler.text)
                          });
                        }
                        countControler.clear();
                        weightControler.clear();
                        notesControler.clear();
                        dateControler.clear();
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
