import 'dart:developer';
import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:repository/features/home/domain/model/main_model.dart';
import 'package:repository/features/home/presentation/manager/cubit/data_cubit.dart';
import 'package:repository/features/home/presentation/manager/cubit/data_state.dart';
import 'package:repository/features/home/presentation/widgets/list_view_item.dart';
import 'package:repository/features/home/presentation/widgets/search_text_field.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    super.key,
  });

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  String? id;

  bool initial = true;
  late DatabaseReference query;
  // ignore: prefer_typing_uninitialized_variables

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then(
      (value) {
        if (initial) {
          setState(() {
            id = value.getString('idToken');
            initial = false;
          });
        }
      },
    );
    setState(() {
      query = FirebaseDatabase.instance.ref('users/$id');
    });
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
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
                  if (state is HomeLoaded) {
                    return FirebaseAnimatedList(
                      query: state.query,
                      itemBuilder: (BuildContext context, DataSnapshot snapshot,
                          Animation<double> animation, int index) {
                        var data = snapshot.value as Map<dynamic, dynamic>;
                        return ListViewItem(
                            categoryName: snapshot.key!,
                            quantity: data['production']['count'] -
                                data['sallary']['sallary']);
                      },
                    );
                  } else if (state is HomeLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is HomeError) {
                    return Center(
                      child: Text(state.message),
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
      },
    );
  }
}

// class GetPref {
//   static String? id;
//   static Future<String> getpref() async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     id = pref.getString('idToken');
//     return Future.value(id);
//   }
// }
