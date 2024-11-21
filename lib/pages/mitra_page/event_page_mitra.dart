import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/filter_sidebar.dart';
import 'package:pad_fundation/widgets/mitra/event_card_mitra.dart';
import 'package:pad_fundation/widgets/mitra/event_tile_mitra.dart';

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

    Widget categories() {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/festival-mitra');
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
                    Navigator.pushNamed(context, '/kuliner-mitra');
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
                    Navigator.pushNamed(context, '/pendidikan-mitra');
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
                    Navigator.pushNamed(context, '/seniman-mitra');
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
              EventCardMitra(
                imagePath: 'assets/img_music_fest.png',
                status: 'OFFLINE',
                title: 'Music Fest 2024',
                collectedAmount: 'Rp90.000.000',
                progress: 0.9,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: ['Festival', 'Musik', 'EDM', 'Hiburan', 'DJ', 'Live'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-mitra');
                },
              ),
              EventCardMitra(
                imagePath: 'assets/img_kulfood.png',
                status: 'OFFLINE',
                title: 'KulFood 2024 ',
                collectedAmount: 'Rp900.000',
                progress: 0.2,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: ['Festival', 'Kuliner', 'Kompetisi', 'Live Musik', 'Live'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-mitra');
                },
              ),
              EventCardMitra(
                imagePath: 'assets/img_summer_party.png',
                status: 'OFFLINE',
                title: 'KulFood 2024',
                collectedAmount: 'Rp900.000',
                progress: 0.2,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: ['Pantai', 'Pesta', 'Liburan', 'Musik', 'Dress'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-mitra');
                },
              ),
              EventCardMitra(
                imagePath: 'assets/img_food_fest.png',
                status: 'OFFLINE',
                title: 'FoodFest 2024',
                collectedAmount: 'Rp900.000',
                progress: 0.2,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: ['Festival', 'Kuliner', 'Weekend', 'Live Musik', 'Live'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-mitra');
                },
              ),
              EventCardMitra(
                imagePath: 'assets/img_educ_fest.png',
                status: 'ONLINE',
                title: 'Educ Fest 2024',
                collectedAmount: 'Rp10.000.000',
                progress: 0.95,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: ['Pendidikan', 'Seminar', 'Konsultasi', 'Formal'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-mitra');
                },
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
              EventTileMitra(
                imagePath: 'assets/img_bali_fest.png',
                status: 'OFFLINE',
                title: 'Bali Fest 2024',
                collectedAmount: 'Rp1.000.000',
                progress: 0.1,
                daysRemaining: 230,
                donorshipCount: 100,
                eventDate: '20 Mei 2024',
                categories: ['Festival', 'Budaya', 'Bali', 'Seni'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-mitra');
                  print('Navigate to detail');
                },
              ),
              EventTileMitra(
                imagePath: 'assets/img_summer_party.png',
                status: 'OFFLINE',
                title: 'Summer Party',
                collectedAmount: 'Rp5.000.000',
                progress: 0.2,
                daysRemaining: 230,
                donorshipCount: 100,
                eventDate: '20 Mei 2024',
                categories: ['Pantai', 'Pesta', 'Musik', 'Liburan'],
                onTap: () {
                  print('Navigate to detail');
                  Navigator.pushNamed(context, '/detail-event-mitra');
                },
              ),
              EventTileMitra(
                imagePath: 'assets/img_nobar_cinema.png',
                status: 'OFFLINE',
                title: 'Nobar Cinema',
                collectedAmount: 'Rp1.900.000',
                progress: 0.5,
                daysRemaining: 230,
                donorshipCount: 100,
                eventDate: '20 Mei 2024',
                categories: ['Film', 'Spoiler', 'Diskusi', 'Nobar'],
                onTap: () {
                  print('Navigate to detail');
                  Navigator.pushNamed(context, '/detail-event-mitra');
                },
              ),
              EventTileMitra(
                imagePath: 'assets/img_rock_fest.png',
                status: 'OFFLINE',
                title: 'Rock Fest',
                collectedAmount: 'Rp5.900.000',
                progress: 0.3,
                daysRemaining: 230,
                donorshipCount: 100,
                eventDate: '20 Mei 2024',
                categories: ['Musik', 'Festival', 'Rock', 'Karaoke'],
                onTap: () {
                  print('Navigate to detail');
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