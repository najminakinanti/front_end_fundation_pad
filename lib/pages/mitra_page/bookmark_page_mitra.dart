import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/mitra/event_card_bookmark_mitra.dart';

class BookmarkPageMitra extends StatelessWidget {

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
                      'Bookmarks',
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

    Widget body() {
      return Container(
        margin: EdgeInsets.only(top: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              EventCardBookmarkMitra(
                imageUrl: 'assets/img_music_fest.png',
                status: 'OFFLINE',
                eventName: 'Music Fest 2024',
                date: '20 Mei 2024',
                progress: 0.9,
                collectedAmount: 'Rp90.000.000',
                donorshipCount: '100',
                daysLeft: '230',
                categories: ['Festival', 'Musik', 'EDM', 'Hiburan', 'DJ', 'Live'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-mitra');
                },
              ),
              EventCardBookmarkMitra(
                imageUrl: 'assets/img_foodfest.png',
                status: 'OFFLINE',
                eventName: 'KulFood 2024',
                date: '20 Mei 2024',
                progress: 0.8,
                collectedAmount: 'Rp900.000',
                donorshipCount: '100',
                daysLeft: '230',
                categories: ['Kuliner', 'Live Musik', 'Festival', 'Seafood', 'BBQ', 'Food Truck'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-mitra');
                },
              ),
              EventCardBookmarkMitra(
                imageUrl: 'assets/img_kochella.png',
                status: 'OFFLINE',
                eventName: 'KoChella 2024',
                date: '20 Mei 2024',
                progress: 0.7,
                collectedAmount: 'Rp900.000',
                donorshipCount: '100',
                daysLeft: '230',
                categories: ['Musik', 'Festival', 'Budaya', 'Live', 'EDM', 'K-Pop'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-mitra');
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
            horizontal: defaultMargin
        ),
        children: [
          body(),
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
