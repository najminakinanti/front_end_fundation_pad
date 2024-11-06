import 'package:flutter/material.dart';

import '../../../theme.dart';

class ProfilePageMitra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget header() {
      return Container(
        alignment: Alignment.centerLeft,
        child: Text(
          'Akun',
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