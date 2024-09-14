import 'package:firebase_auth/firebase_auth.dart';
import 'package:repository/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:repository/features/auth/presentation/pages/auth_page.dart';
import 'package:repository/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:repository/features/home/presentation/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:repository/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var idToken = pref.getString('idToken');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    idToken: idToken,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.idToken});
  final String? idToken;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..fetchData(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: idToken != null ? const HomePage() : const AuthPage(),
          //
        ),
      ),
    );
  }
}
