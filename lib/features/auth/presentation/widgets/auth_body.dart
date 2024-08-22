import 'package:repository/features/auth/presentation/manager/cubit/auth_cubit.dart';
import 'package:repository/features/auth/presentation/widgets/google_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isloading;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          isloading = true;
        } else {
          isloading = false;
        }
      },
      builder: (context, state) {
        return InkWell(
          onTap: () async {
            await BlocProvider.of<AuthCubit>(context).signInWithGoogle();
          },
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.04,
              child: Card(
                color: const Color.fromARGB(255, 199, 192, 192),
                child: Row(
                  children: [
                    SizedBox(
                      height: 120.h,
                      width: 120.w,
                      child: Image.asset('assets/images/logo_google.png'),
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 22.sp, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
