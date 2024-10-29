import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget bottomNav() {
      return BottomNavigationBar(
          backgroundColor: navbarColor,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_event.png',
                width: 24,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_eye.png',
                width: 24,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_eye.png',
                width: 24,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icon_eye.png',
                width: 24,
              ),
              label: '',
            ),
          ]);
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: bottomNav(),
      body: Center(
          child: Text(
            'Main Page',
          ),
      ),
    );
  }
}
