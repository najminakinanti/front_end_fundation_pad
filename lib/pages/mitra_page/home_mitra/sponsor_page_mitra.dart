import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class SponsorPageMitra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget header() {
      return Container(
        alignment: Alignment.centerLeft,
        child: Text(
          'Sponsor',
          style: blackTextStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            header(),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
