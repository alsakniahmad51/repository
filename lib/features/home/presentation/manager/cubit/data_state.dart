import 'package:firebase_database/firebase_database.dart';
import 'package:repository/features/home/domain/model/main_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final DatabaseReference query;
  final User mainModel;
  HomeLoaded({required this.mainModel, required this.query});
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
