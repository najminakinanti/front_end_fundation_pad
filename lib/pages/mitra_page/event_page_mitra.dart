import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/event_card_mitra.dart';
import 'package:pad_fundation/widgets/event_tile.dart';
import 'package:pad_fundation/widgets/event_tile_mitra.dart';
import 'package:pad_fundation/widgets/filter_modal.dart';

class EventPageMitra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(140.0),
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
                        'Events',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
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
                          child: Row(
                            children: [
                              Image.asset('assets/icon_search.png', width: 18),
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
                ],
            ),
          ),
        ),
      );
    }

    Widget categories() {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/event-by-category');
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: backgroundColor3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/icon_festival.png',
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Festival',
                  style: blackTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/event-by-category');
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: backgroundColor3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/icon_kuliner.png',
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Kuliner',
                  style: blackTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/event-by-category');
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: backgroundColor3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/icon_pendidikan.png',
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Pendidikan',
                  style: blackTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/event-by-category');
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: backgroundColor3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/icon_seniman.png',
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Seniman',
                  style: blackTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/event-page-by-category-mitra');
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: backgroundColor3,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/icon_lainnya.png',
                      width: 30,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Lainnya',
                  style: blackTextStyle.copyWith(
                    fontSize: 10,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget topEventTitle() {
      return Container(
        margin: EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Event Populer',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),

            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/event-by-category');
                },
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

    Widget topEvent() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              EventCardMitra(),
              EventCardMitra(),
              EventCardMitra(),
              EventCardMitra(),
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
                onPressed: () {
                  //
                },
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
              EventTileMitra(),
              EventTileMitra(),
              EventTileMitra(),
              EventTileMitra(),
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
          categories(),
          topEventTitle(),
          topEvent(),
          allEventTitle(),
          allEvent(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: header(),
      body: content(),
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