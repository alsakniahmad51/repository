import 'package:flutter/material.dart';

class ShowBottomSheet {
  static Future<dynamic> showBottomSheet(BuildContext context,
      {required Widget child, required double initSize}) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return AbsorbPointer(
          absorbing: false,
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: DraggableScrollableSheet(
              expand: false,
              initialChildSize: initSize,
              maxChildSize: 1.0,
              minChildSize: 0.32,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                  controller: scrollController,
                  child: Directionality(
                      textDirection: TextDirection.rtl, child: child),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
