// filter_modal.dart
import 'package:flutter/material.dart';
import 'filter_sidebar.dart';

void showModalRightSheet(
    BuildContext context,
    Function(Map<String, dynamic>) onApply,
    ) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Dismiss',
    pageBuilder: (context, animation, secondaryAnimation) {
      return Align(
        alignment: Alignment.centerRight,
        child: FilterSidebar(
          onApply: (filters) {
            Navigator.of(context).pop();
            onApply(filters);
          },
        ),
      );
    },
    transitionDuration: Duration(milliseconds: 300),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      final offsetAnimation = Tween<Offset>(
        begin: Offset(1, 0),
        end: Offset.zero,
      ).animate(animation);
      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
