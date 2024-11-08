import 'package:flutter/material.dart';
import 'package:pad_fundation/pages/organizer_page/home_organizer/chat_page_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/home_organizer/home_page_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/home_organizer/profile_page_organizer.dart';
import 'package:pad_fundation/pages/organizer_page/home_organizer/event_page_organizer.dart';
import 'package:pad_fundation/theme.dart';

class MainPageOrganizer extends StatefulWidget {

  @override
  State<MainPageOrganizer> createState() => _MainPageOrganizerState();
}

class _MainPageOrganizerState extends State<MainPageOrganizer> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    Widget bottomNav() {
      return ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BottomNavigationBar(
          backgroundColor: navbarColor,
          currentIndex: currentIndex,
          onTap: (value) {
            print(value);
            setState(() {
              currentIndex = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedItemColor: textColor2,
          unselectedItemColor: gray,
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 5),
                child: Image.asset(
                  'assets/icon_beranda.png',
                  width: 24,
                  color: currentIndex == 0 ? textColor2 : gray,
                ),
              ),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 5),
                child: Image.asset(
                  'assets/icon_event.png',
                  width: 24,
                  color: currentIndex == 1 ? textColor2 : gray,
                ),
              ),
              label: 'Events',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 5),
                child: Image.asset(
                  'assets/icon_chat.png',
                  width: 24,
                  color: currentIndex == 2 ? textColor2 : gray,
                ),
              ),
              label: 'Pesan',
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(top: 5),
                child: Image.asset(
                  'assets/icon_profile.png',
                  width: 24,
                  color: currentIndex == 3 ? textColor2 : gray,
                ),
              ),
              label: 'Akun',
            ),
          ],
        ),
      );
    }

    Widget body() {
      switch(currentIndex) {
        case 0:
          return HomePageOrganizer();
          break;
        case 1:
          return EventPageOrganizer();
          break;
        case 2:
          return ChatPageOrganizer();
          break;
        case 3:
          return ProfilePageOrganizer();
          break;
        default:
          return HomePageOrganizer();
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              defaultMargin,
              defaultMargin,
              defaultMargin,
              0,
            ),
            child: body(),
          ),
          Positioned(
            left: defaultMargin,
            right: defaultMargin,
            bottom: 10,
            child: bottomNav(),
          ),
        ],
      ),
    );
  }
}