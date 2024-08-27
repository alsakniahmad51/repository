// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repository/features/home/presentation/manager/cubit/data_cubit.dart';
import 'package:repository/features/home/presentation/manager/cubit/data_state.dart';
import 'package:repository/features/production/presentation/widgets/build_product_list_tile.dart';
import 'package:repository/features/production/presentation/widgets/production_table_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductionBody extends StatelessWidget {
  const ProductionBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoaded) {
          return Center(
            child: SizedBox(
                width: MediaQuery.of(context).size.width / 1.08,
                child: FirebaseAnimatedList(
                  query: state.query,
                  itemBuilder: (context, snapshot, animation, index) {
                    var data = snapshot as Map<dynamic, dynamic>;
                    return buildProductListTile(
                        quantity: data['']['production']['count'],
                        wight: data['']['production']['weight'],
                        productionDate: DateTime(2024, 3, 24),
                        notes: data['']['production']['notes']);
                  },
                )),
          );
        } else if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is HomeError) {
          return Text(state.message);
        } else {
          return Text("somthing was rong");
        }
      },
    );
  }
}




/**
 * 
 * 
 * IntrinsicHeight(
            child: Column(
              children: [
                ProductionTableRow(
                  index: index,
                ),
              ],
            ),
          )
 */