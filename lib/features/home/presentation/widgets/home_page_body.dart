import 'dart:ffi';

import 'package:repository/features/home/presentation/widgets/list_view_item.dart';
import 'package:repository/features/home/presentation/widgets/search_text_field.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageBody extends StatelessWidget {
  HomePageBody({
    super.key,
  });
  final query = FirebaseDatabase.instance.ref('users/Ahmad');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20.h,
        ),
        const SafeArea(
            child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: SearchTextField(),
        )),
        SizedBox(height: 20.h),
        Expanded(
          child: FutureBuilder(
            future: query.get(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return FirebaseAnimatedList(
                  query: query,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    Map mydata = snapshot.value as Map;
                    return ListViewItem(
                        categoryName: snapshot.key!,
                        quantity: mydata['production']['count'] -
                            mydata['sales']['sales']);
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }
}
