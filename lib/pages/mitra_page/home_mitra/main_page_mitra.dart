import 'package:flutter/material.dart';
import 'package:pad_fundation/pages/mitra_page/home_mitra/chat_page_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/event_page_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/home_mitra/home_page_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/home_mitra/profile_page_mitra.dart';
import 'package:pad_fundation/pages/mitra_page/home_mitra/sponsor_page_mitra.dart';
import 'package:pad_fundation/theme.dart';

class MainPageMitra extends StatefulWidget {

  @override
  State<MainPageMitra> createState() => _MainPageMitraState();
}

class _MainPageMitraState extends State<MainPageMitra> {

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
                  'assets/icon_sponsor.png',
                  width: 24,
                  color: currentIndex == 1 ? textColor2 : gray,
                ),
              ),
              label: 'Sponsor',
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
          return HomePageMitra();
          break;
        case 1:
          return SponsorPageMitra();
          break;
        case 2:
          return ChatPageMitra();
          break;
        case 3:
          return ProfilePageMitra();
          break;
        default:
          return HomePageMitra();
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