import 'package:firebase_database/firebase_database.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final DatabaseReference query;

  final String idToken;

  HomeLoaded({required this.idToken, required this.query});
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
