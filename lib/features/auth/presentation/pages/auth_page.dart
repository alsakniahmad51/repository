import 'package:repository/features/auth/presentation/widgets/auth_body.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthPageBody(),
    );
  }
}
