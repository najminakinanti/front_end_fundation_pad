import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/event_card_bookmark.dart';

class BookmarkPageMitra extends StatelessWidget {

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
              'Bookmarks',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      );
    }

    Widget body() {
      return Container(
        margin: EdgeInsets.only(top: 17),
        child: SingleChildScrollView(
          child: Column(
            children: [
              EventCardBookmark(),
              EventCardBookmark(),
              EventCardBookmark(),
              EventCardBookmark(),
            ],
          ),
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
                    body(),
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
