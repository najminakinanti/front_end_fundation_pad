import 'package:flutter/material.dart';
import 'package:pad_fundation/mitra_page/home/chat_page.dart';
import 'package:pad_fundation/mitra_page/home/event_page.dart';
import 'package:pad_fundation/mitra_page/home/home_page.dart';
import 'package:pad_fundation/mitra_page/home/profile_page.dart';
import 'package:pad_fundation/theme.dart';

class MainPage extends StatefulWidget {

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

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
              label: 'Event',
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
          return HomePage();
          break;
        case 1:
          return EventPage();
          break;
        case 2:
          return ChatPage();
          break;
        case 3:
          return ProfilePage();
          break;
        default:
          return HomePage();
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