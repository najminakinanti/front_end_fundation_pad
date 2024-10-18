import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pad_fundation/theme.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    // TODO: implement initState

    // mengatur pindah halaman dari logo selama 3 detik
    Timer(
      Duration(seconds: 3),
          () => Navigator.pushNamed(context, '/boarding-1'),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Container(
          width: 263,
          height: 70,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    'assets/img_logo_splash.png',
                ),
            ),
          ),
        ),
      ),
    );
  }
}
