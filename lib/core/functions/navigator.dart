import 'package:repository/features/production/presentation/pages/production_page.dart';
import 'package:flutter/material.dart';

class MovingNavigator {
  static navToPage({required BuildContext context, required Widget page}) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => page,
    ));
  }
}
