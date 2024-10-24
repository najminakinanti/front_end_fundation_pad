import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Widget homepageButton() {
      return FloatingActionButton(
        onPressed: () {},
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: homepageButton(),
      body: Center(
          child: Text(
            'Main Page',
          ),
      ),
    );
  }
}
