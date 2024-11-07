import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

import '../../widgets/sponsor_card.dart';

class DaftarSponsorMitra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                'assets/icon_panah_kiri.png',
                width: 8,
              ),
            ),
            SizedBox(width: 20),
            Text(
              'Daftar Sponsor Music Fest',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      );
    }

    Widget sponsor() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Gold',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SponsorCard(),
            SponsorCard(),
            SponsorCard(),
            SponsorCard(),
            SponsorCard(),
            SponsorCard(),
            SizedBox(height: 10),
            Text(
              'Silver',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SponsorCard(),
            SponsorCard(),
            SponsorCard(),
            SponsorCard(),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: defaultMargin,
                  right: defaultMargin,
                  bottom: defaultMargin,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title(),
                    sponsor(),
                  ],
                ),
              ),
              //
            ],
          ),
        ),
      ),
    );
  }
}