import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/event_card.dart';
import 'package:pad_fundation/widgets/event_card_bookmark.dart';
import 'package:pad_fundation/widgets/event_tile.dart';
import 'package:pad_fundation/widgets/filter_modal.dart';

class EventByCategory extends StatelessWidget {
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
              'Events',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: bold,
              ),
            ),
          ],
        ),
      );
    }

    Widget searchBar() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: textColor3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Container(
                  child: Row(
                    children: [
                      Image.asset('assets/icon_search.png', width: 18,),
                      SizedBox(width: 5),
                      Text(
                        'Cari Event',
                        style: veryLightGrayTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 5),
            TextButton(
              onPressed: () {
                showModalRightSheet(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: textColor3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Image.asset('assets/icon_filter.png', width: 24),
            ),
          ],
        ),
      );
    }

    Widget topEventTitle() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Text(
          'Event Populer',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
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
                    searchBar(),
                    topEventTitle(),
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

  void showModalRightSheet(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return RightSideModal();
        },
        transitionsBuilder: (_, animation, __, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }
}

class RightSideModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: textColor2.withOpacity(0.5),
      body: Row(
        children: [
          Spacer(),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: textColor3,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: FilterModal(),
          ),
        ],
      ),
    );
  }
}