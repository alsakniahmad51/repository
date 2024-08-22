// ignore: depend_on_referenced_packages

import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DeleteActionPane extends StatelessWidget {
  const DeleteActionPane({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      label: "حذف الصنف",
      icon: Icons.delete_forever,
      backgroundColor: Colors.red,
      onPressed: (context) {
        log("حذف");
      },
    );
  }
}
