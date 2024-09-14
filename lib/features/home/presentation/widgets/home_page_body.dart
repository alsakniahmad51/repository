import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:repository/features/home/presentation/manager/cubit/home_state.dart';
import 'package:repository/features/home/presentation/widgets/list_view_item.dart';
import 'package:repository/features/home/presentation/widgets/search_text_field.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    super.key,
  });

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  bool initial = true;

  // ignore: prefer_typing_uninitialized_variables

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SafeArea(
            child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: SearchTextField(),
        )),
        SizedBox(height: 20.h),
        Expanded(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is HomeLoaded) {
                return FirebaseAnimatedList(
                  query: state.query,
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    var data = snapshot.value as Map<dynamic, dynamic>;
                    List? production = data['production'] as List? ?? [];
                    var sallary = data['sallary'] as List? ?? [];
                    var length1 = sallary.length;
                    int? length = production.length;
                    double sumProduction = 0;
                    double sumSallary = 0;
                    for (var i = 0; i < length; i++) {
                      sumProduction = sumProduction + production[i]['count'];
                    }
                    for (var i = 0; i < length1; i++) {
                      sumSallary = sumSallary + sallary[i]['sallary'];
                    }
                    double avg = sumProduction - sumSallary;
                    return ListViewItem(
                        categoryName: snapshot.key!,
                        quantity: avg % 1 == 0 ? avg.toInt() : avg);
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
