// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:repository/core/functions/show_bottom_sheet.dart';
import 'package:repository/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:repository/features/home/presentation/manager/cubit/home_state.dart';
import 'package:repository/features/production/presentation/widgets/bottom_sheet_body_production.dart';
import 'package:repository/features/production/presentation/widgets/build_product_list_tile.dart';
import 'package:flutter/material.dart';

class ProductionBody extends StatefulWidget {
  const ProductionBody({
    super.key,
    required this.categoryName,
  });
  final String categoryName;

  @override
  State<ProductionBody> createState() => _ProductionBodyState();
}

class _ProductionBodyState extends State<ProductionBody> {
  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late List production;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.w),
            child: InkWell(
              onTap: () {
                ShowBottomSheet.showBottomSheet(context,
                    child: BottomSheetBodyProduction(
                      categoryName: widget.categoryName,
                      production: production,
                    ),
                    initSize: 0.6);
              },
              child: Container(
                height: 40.h,
                width: 40.w,
                decoration: BoxDecoration(
                    color: const Color(0xffeaddfa),
                    borderRadius: BorderRadius.circular(20.r)),
                child: const Icon(Icons.add),
              ),
            ),
          )
        ],
        scrolledUnderElevation: 0.0,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          widget.categoryName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoaded) {
            var ref = 'users/${state.idToken}/${widget.categoryName}';
            final query = FirebaseDatabase.instance.ref(ref);
            return FutureBuilder(
              future: query.get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!.value as dynamic;
                  production = data['production'] ?? [];
                  return Center(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width / 1.08,
                        child: ListView.builder(
                          itemCount: production.length,
                          itemBuilder: (context, index) {
                            return buildProductListTile(
                                context: context,
                                quantity: double.parse(
                                    production[index]['count'].toString()),
                                wight: double.parse(
                                    production[index]['weight'].toString()),
                                productionDate: DateTime(2024, 3, 24),
                                notes: production[index]['notes'].toString(),
                                refrens: ref,
                                index: index,
                                production: production);
                          },
                        )),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            );
          } else if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomeError) {
            return Text(state.message);
          } else {
            return const Text("somthing was rong");
          }
        },
      ),
    );
  }
}
