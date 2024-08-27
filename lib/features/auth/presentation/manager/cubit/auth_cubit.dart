import 'dart:developer';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final GoogleSignIn googleSignIn = GoogleSignIn();
  static String? userId;

  Future<String?> getId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString('idToken');
    log(Future.value(userId).toString());
    return Future.value(userId);
  }

  Future<UserCredential> signInWithGoogle() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Trigger the authentication flow
    emit(AuthLoading());
    final googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await prefs.setString('idToken', googleUser!.email.split("@")[0]);
    userId = prefs.getString('idToken');

    // Once signed in, return the UserCredential
    var UserCredential = FirebaseAuth.instance.signInWithCredential(credential);
    emit(AuthSuccess());
    return await UserCredential;
  }
}
