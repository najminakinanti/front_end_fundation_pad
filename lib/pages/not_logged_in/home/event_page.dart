import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/guess/event_card.dart';
import 'package:pad_fundation/widgets/guess/event_tile.dart';

import '../../../widgets/filter_sidebar.dart';

class EventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(110.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          centerTitle: false,
          flexibleSpace: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
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
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        decoration: BoxDecoration(
                          color: textColor3,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/icon_search.png', width: 18),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                onChanged: (value) {

                                },
                                style: veryLightGrayTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: medium,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Cari Event',
                                  hintStyle: veryLightGrayTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: medium,
                                  ),
                                  border: InputBorder.none,
                                ),
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
                        minimumSize: Size(50, 50),
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


    Widget topEventTitle() {
      return Container(
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
              EventCard(
                imagePath: 'assets/img_music_fest.png',
                status: 'Offline',
                title: 'Music Fest 2024',
                collectedAmount: 'Rp90.000.000',
                progress: 0.9,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: [
                  'Festival',
                  'Musik',
                  'EDM',
                  'Hiburan',
                  'DJ',
                  'Live'
                ],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event');
                },
              ),
              EventCard(
                imagePath: 'assets/img_educ_fest.png',
                status: 'Online',
                title: 'Educ Fest 2024',
                collectedAmount: 'Rp10.000.000',
                progress: 0.95,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: [
                  'Pendidikan',
                  'Seminar',
                  'Konsultasi',
                  'Formal'
                ],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event');
                },
              ),
              EventCard(
                imagePath: 'assets/img_kulfood.png',
                status: 'Offline',
                title: 'KulFood 2024',
                collectedAmount: 'Rp50.000.000',
                progress: 0.2,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: [
                  'Festival',
                  'Kuliner',
                  'Kompetisi',
                  'Live Musik',
                  'Live'
                ],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event');
                },
              ),
              EventCard(
                imagePath: 'assets/img_summer_shimer.png',
                status: 'Offline',
                title: 'Summer Shimer 2024',
                collectedAmount: 'Rp900.000',
                progress: 0.2,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: [
                  'Pantai',
                  'Pesta',
                  'Liburan',
                  'Musik',
                  'Dress'
                ],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event');
                },
              ),
              EventCard(
                imagePath: 'assets/img_food_fest.png',
                status: 'Offline',
                title: 'Summer Shimer 2024',
                collectedAmount: 'Rp900.000',
                progress: 0.2,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: [
                  'Festival',
                  'Kuliner',
                  'Weekend',
                  'Live Musik',
                  'Live'
                ],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event');
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget allEventTitle() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Text(
          'Semua Event',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget allEvent() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              EventTile(
                imagePath: 'assets/img_bali_fest.png',
                status: 'OFFLINE',
                title: 'Bali Fest 2024',
                collectedAmount: 'Terkumpul Rp1.000.000',
                progress: 0.1,
                daysRemaining: 230,
                donorshipCount: 100,
                date: '20 Mei 2024',
                categories: ['Festival', 'Budaya', 'Bali', 'Seni'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event');
                },
              ),
              EventTile(
                imagePath: 'assets/img_summer_party.png',
                status: 'OFFLINE',
                title: 'Summer Party',
                collectedAmount: 'Terkumpul Rp5.000.000',
                progress: 0.2,
                daysRemaining: 230,
                donorshipCount: 100,
                date: '20 Mei 2024',
                categories: ['Pantai', 'Pesta','Musik', 'Liburan'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event');
                },
              ),
              EventTile(
                imagePath: 'assets/img_nobar_cinema.png',
                status: 'ONLINE',
                title: 'Nobar Cinema',
                collectedAmount: 'Terkumpul Rp1.900.000',
                progress: 0.5,
                daysRemaining: 230,
                donorshipCount: 100,
                date: '20 Mei 2024',
                categories: ['Film', 'Spoiler', 'Diskusi', 'Nobar'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event');
                },
              ),
              EventTile(
                imagePath: 'assets/img_rock_fest.png',
                status: 'OFFLINE',
                title: 'Rock Fest',
                collectedAmount: 'Terkumpul Rp5.900.000',
                progress: 0.3,
                daysRemaining: 230,
                donorshipCount: 100,
                date: '20 Mei 2024',
                categories: ['Musik', 'Festival', 'Rock', 'Karaoke'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event');
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return ListView(
        children: [
          topEventTitle(),
          topEvent(),
          allEventTitle(),
          allEvent(),
          SizedBox(height: 80),
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
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      pageBuilder: (context, animation, secondaryAnimation) {
        return Align(
          alignment: Alignment.centerRight,
          child: FilterSidebar(
            onApply: (filters) {
              print('Selected Filters: $filters');
            },
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final offsetAnimation = Tween<Offset>(
          begin: Offset(1, 0),
          end: Offset(0, 0),
        ).animate(animation);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}