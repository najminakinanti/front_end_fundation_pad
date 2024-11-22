import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';
import 'package:pad_fundation/widgets/filter_sidebar.dart';
import 'package:pad_fundation/widgets/organizer/my_event_card_organizer.dart';

class EventPageOrganizer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(115.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: backgroundColor,
          centerTitle: false,
          flexibleSpace: Container(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      'Event yang Dikelola',
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

    Widget addEventButton() {
      return Container(
        height: 40,
        width: double.infinity,
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add-event');
          },
          style: TextButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: primaryColor,
                width: 1,
              ),
            ),
          ),
          child: Text(
            'TAMBAH EVENT',
            style: whiteTextStyle.copyWith(
              fontSize: 14,
              fontWeight: bold,
            ),
          ),
        ),
      );
    }

    Widget eventTitle() {
      return Container(
        margin: EdgeInsets.only(top: 20),
        alignment: Alignment.centerLeft,
        child: Text(
          'Event Saya',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget allSponsor() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyEventCardOrganizer(
                imageUrl: 'assets/img_music_fest.png',
                status: 'OFFLINE',
                eventName: 'Music Fest 2024 ',
                date: '20 Mei 2024',
                progress: 0.7,
                collectedAmount: 'Rp900.000',
                donorshipCount: '100',
                daysLeft: '230',
                categories: ['Musik', 'Festival', 'Hiburan'],
                onTap: () {
                  Navigator.pushNamed(context, '/detail-my-event-organizer');
                },
              ),
              MyEventCardOrganizer(
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
                  Navigator.pushNamed(context, '/detail-my-event-organizer');
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
          addEventButton(),
          eventTitle(),
          allSponsor(),
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