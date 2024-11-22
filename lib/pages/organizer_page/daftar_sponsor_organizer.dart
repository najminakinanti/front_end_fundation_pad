import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

import '../../widgets/sponsor_card.dart';

class DaftarSponsorOrganizer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          centerTitle: false,
          flexibleSpace: Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, defaultMargin, defaultMargin, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
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
              ],
            ),
          ),
        ),
      );
    }

    Widget sponsor() {
      return Container(
        margin: EdgeInsets.only(top: 5),
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
            SponsorCard(
              imageUrl: 'assets/img_bittersweet.png',
              name: 'Bittersweet by Najla',
              iconUrl: 'assets/icon_gold.png',
              category: 'Gold',
              amount: 'Rp35.000.000',
            ),
            SponsorCard(
              imageUrl: 'assets/img_the_organizer.png',
              name: 'The Organizer',
              iconUrl: 'assets/icon_gold.png',
              category: 'Gold',
              amount: 'Rp34.000.000',
            ),
            SponsorCard(
              imageUrl: 'assets/img_ozora.png',
              name: 'Ozora Organizer',
              iconUrl: 'assets/icon_gold.png',
              category: 'Gold',
              amount: 'Rp33.000.000',
            ),
            SizedBox(height: 10),
            Text(
              'Silver',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SponsorCard(
              imageUrl: 'assets/img_raorganizer.png',
              name: 'Raorganizer',
              iconUrl: 'assets/icon_silver.png',
              category: 'Silver',
              amount: 'Rp25.000.000',
            ),
            SponsorCard(
              imageUrl: 'assets/img_space.png',
              name: 'Space Organizer',
              iconUrl: 'assets/icon_silver.png',
              category: 'Silver',
              amount: 'Rp20.000.000',
            ),
            SponsorCard(
              imageUrl: 'assets/img_raorganizer.png',
              name: 'Raorganizer',
              iconUrl: 'assets/icon_silver.png',
              category: 'Silver',
              amount: 'Rp25.000.000',
            ),
            SponsorCard(
              imageUrl: 'assets/img_space.png',
              name: 'Space Organizer',
              iconUrl: 'assets/icon_silver.png',
              category: 'Silver',
              amount: 'Rp20.000.000',
            ),
            SponsorCard(
              imageUrl: 'assets/img_space.png',
              name: 'Organizer Event',
              iconUrl: 'assets/icon_silver.png',
              category: 'Silver',
              amount: 'Rp15.000.000',
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
            horizontal: defaultMargin
        ),
        children: [
          sponsor(),
          SizedBox(height: 30,),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      body: content(),
    );

  }
}