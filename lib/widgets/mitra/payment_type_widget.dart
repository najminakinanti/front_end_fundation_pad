import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class PaymentTypeWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final int index;
  final int selectedIndex;
  final Function(int) onTap;

  PaymentTypeWidget({
    required this.imagePath,
    required this.title,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: defaultMargin),
        decoration: BoxDecoration(
          color: textColor3,
          border: Border.all(
            color: isSelected ? primaryColor : grayBorderPayment,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 56,
            ),
            SizedBox(width: 15),
            Text(
              title,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: regular,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
