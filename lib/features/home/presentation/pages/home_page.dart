import 'package:repository/core/functions/show_bottom_sheet.dart';
import 'package:repository/features/home/domain/model/main_model.dart';
import 'package:repository/features/production/domain/model/production_model.dart';
import 'package:repository/features/home/domain/model/sallry_model.dart';
import 'package:repository/features/home/presentation/widgets/bottom_sheet_body.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // DatabaseReference ref =
    //     FirebaseDatabase.instance.ref("users/Ahmad/${mainModel.name}");
    return Scaffold(
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
      body: HomePageBody(),
    );
  }
}
