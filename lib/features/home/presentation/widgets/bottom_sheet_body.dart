import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:repository/core/functions/navigator.dart';
import 'package:repository/core/widgets/custom_botton.dart';
import 'package:repository/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:repository/features/auth/presentation/pages/auth_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomSheetBody extends StatefulWidget {
  const BottomSheetBody({
    super.key,
  });

  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    TextEditingController controller = TextEditingController();
    return Form(
      autovalidateMode: autovalidateMode,
      child: SizedBox(
        height: 450.h,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
          child: Column(
            children: [
              SizedBox(
                height: 60.h,
              ),
              SizedBox(
                width: 380.w,
                child: CustomTextField(
                  controller: controller,
                  hint: "اسم الصنف",
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
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    String? idToken = pref.getString("idToken");

                    DatabaseReference ref =
                        FirebaseDatabase.instance.ref("users/$idToken");
                    FirebaseAuth.instance.signOut();

                    await ref.update({
                      controller.text: {
                        "production": {
                          "count": 0,
                          "date": "2024-04-02 00:00:00.000",
                          "notes": "dddd",
                          "weight": 0
                        },
                        "sallary": {
                          "clientName": "عبدو",
                          "notes": "",
                          "orderid": 1300,
                          "sallary": 0,
                          "sallarydate": "2024-04-02 00:00:00.000"
                        }
                      },
                    });
                    controller.clear();
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
