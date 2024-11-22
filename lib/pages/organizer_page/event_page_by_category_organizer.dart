import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/organizer/event_card_organizer.dart';

import '../../widgets/filter_sidebar.dart';

class EventPageByCategoryOrganizer extends StatelessWidget {
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
                        height: 50,
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
          'Event Populer',
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
              EventCardOrganizer(
                imagePath: 'assets/img_music_fest.png',
                status: 'OFFLINE',
                title: 'Music Fest 2024',
                collectedAmount: 'Rp90.000.000',
                progress: 0.9,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: ['Festival', 'Musik', 'EDM', 'Hiburan', 'DJ', 'Live'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-organizer');
                },
              ),
              EventCardOrganizer(
                imagePath: 'assets/img_kulfood.png',
                status: 'OFFLINE',
                title: 'KulFood 2024',
                collectedAmount: 'Rp900.000',
                progress: 0.2,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: ['Festival', 'Kuliner', 'Kompetisi', 'Live Musik', 'Live'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-organizer');
                },
              ),
              EventCardOrganizer(
                imagePath: 'assets/img_food_fest.png',
                status: 'OFFLINE',
                title: 'FoodFest 2024 ',
                collectedAmount: 'Rp900.000',
                progress: 0.2,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: ['Festival', 'Kuliner', 'Weekend', 'Live Music', 'Live'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-organizer');
                },
              ),
              EventCardOrganizer(
                imagePath: 'assets/img_summer_party.png',
                status: 'OFFLINE',
                title: 'FoodFest 2024 ',
                collectedAmount: 'Rp900.000',
                progress: 0.2,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: ['Pantai', 'Pesta', 'Liburan', 'Musik', 'Dress'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-organizer');
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget pendidikanEventTitle() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Text(
          'Event Pendidikan',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget pendidikanEvent() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              EventCardOrganizer(
                imagePath: 'assets/img_experiment_class.png',
                status: 'OFFLINE',
                title: 'Experiment Class',
                collectedAmount: 'Rp85.000.000',
                progress: 0.9,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: ['Belajar', 'Pendidikan', 'Fisika', 'Membaca', 'Diskusi', 'Live'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-organizer');
                },
              ),
              EventCardOrganizer(
                imagePath: 'assets/img_literasi.png',
                status: 'OFFLINE',
                title: 'Literasi Bersama',
                collectedAmount: 'Rp90.000.000',
                progress: 0.9,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: ['Pengetahuan', 'Buku', 'Diskusi', 'Penulis', 'Membaca', 'Live'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-organizer');
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget kulinerEventTitle() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Text(
          'Event Pendidikan',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget kulinerEvent() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              EventCardOrganizer(
                imagePath: 'assets/img_food_fest.png',
                status: 'OFFLINE',
                title: 'Food Fest 2024',
                collectedAmount: 'Rp90.000.000',
                progress: 0.9,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: ['Festival', 'Kuliner', 'Hiburan', 'Nusantara', 'Live Musik', 'Live'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-organizer');
                },
              ),
              EventCardOrganizer(
                imagePath: 'assets/img_kulfood.png',
                status: 'OFFLINE',
                title: 'KulFood 2024',
                collectedAmount: 'Rp900.000',
                progress: 0.2,
                daysRemaining: 230,
                donorshipCount: 100,
                categories: ['Festival', 'Kuliner', 'Kompetisi', 'Live Musik', 'Live'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-event-organizer');
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
          topEventTitle(),
          topEvent(),
          pendidikanEventTitle(),
          pendidikanEvent(),
          kulinerEventTitle(),
          kulinerEvent(),
          SizedBox(height: 30),
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