// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:repository/core/functions/navigator.dart';
import 'package:repository/core/functions/show_bottom_sheet.dart';
import 'package:repository/features/auth/presentation/pages/auth_page.dart';
import 'package:repository/features/home/domain/model/main_model.dart';
import 'package:repository/features/production/domain/model/production_model.dart';
import 'package:repository/features/home/domain/model/sallry_model.dart';
import 'package:repository/features/home/presentation/widgets/bottom_sheet_body.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // DatabaseReference ref =
    //     FirebaseDatabase.instance.ref("users/Ahmad/${mainModel.name}");
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Center(
          child: InkWell(
            onTap: () async {
              await GoogleSignIn().signOut();
              await FirebaseAuth.instance.signOut();
              MovingNavigator.navToPage(
                context: context,
                page: const AuthPage(),
              );
            },
            child: Container(
              height: 50.h,
              width: 200.w,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 199, 192, 192),
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(
                  "تسجيل خروج",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // await ref.set(mainModel.tojson());
          ShowBottomSheet.showBottomSheet(
            context,
            child: const BottomSheetBody(),
            initSize: 0.4,
          );
        },
        child: const Icon(Icons.add),
      ),
      body: const HomePageBody(),
    );
  }
}
