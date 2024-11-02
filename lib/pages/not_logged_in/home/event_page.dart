import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/event_card.dart';
import 'package:pad_fundation/widgets/event_tile.dart';
import 'package:pad_fundation/widgets/filter_modal.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget header() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
          'Top Event',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget topEvent() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: EventCard(),
              ),
              GestureDetector(
                onTap: () {},
                child: EventCard(),
              ),
              GestureDetector(
                onTap: () {},
                child: EventCard(),
              ),
              GestureDetector(
                onTap: () {},
                child: EventCard(),
              ),
            ],
          ),
        ),
      );
    }

    Widget allEventTitle() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Semua Event',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),

            Container(
              child: TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Lihat Semua',
                      style: grayTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: regular,
                      ),
                    ),
                    SizedBox(width: 2),
                    Image.asset(
                      'assets/icon_tanda_panah_kanan.png',
                      width: 15,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget allEvent() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              EventTile(),
              EventTile(),
              EventTile(),
              EventTile(),
            ],
          ),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        searchBar(),
        topEventTitle(),
        topEvent(),
        allEventTitle(),
        allEvent(),
        SizedBox(height: 80),
      ],
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