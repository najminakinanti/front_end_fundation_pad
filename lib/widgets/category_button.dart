import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class CategoryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  CategoryButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          label,
          style: whiteTextStyle.copyWith(
            fontSize: 10,
            fontWeight: regular,
          ),
        ),
      ),
    );
  }
}
