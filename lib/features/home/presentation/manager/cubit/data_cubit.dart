// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:repository/features/home/domain/model/main_model.dart';
import 'package:repository/features/home/presentation/manager/cubit/data_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  late User data;
  Future<void> fetchData() async {
    emit(HomeLoading());

    final prefs = await SharedPreferences.getInstance();
    final idToken = prefs.getString("idToken");
    final query = FirebaseDatabase.instance.ref('users/$idToken');
    final snapshot = await query.get();
    final mydata = snapshot.value as Map<dynamic, dynamic>;
    mydata.values.elementAt(1);
    data = User.fromJson(Map<String, dynamic>.from(mydata));

    if (idToken == null) {
      emit(HomeError("No ID token found"));
      return;
    }

    if (snapshot.exists) {
      emit(HomeLoaded(
        query: query,
        mainModel: data,
      ));
    } else {
      emit(HomeError("No data found"));
    }
  }
}
