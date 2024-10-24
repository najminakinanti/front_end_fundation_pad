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
    // mengatur pindah halaman dari logo selama 3 detik
    Timer(
      Duration(seconds: 3),
          () => Navigator.pushNamed(context, '/home'),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            // Mengatur lebar maksimal logo agar tetap proporsi
            double logoWidth = constraints.maxWidth * 0.7; // 70% dari lebar layar
            if (logoWidth > 263) { // Batas maksimal 263px
              logoWidth = 263;
            }

            return Container(
              width: logoWidth,
              height: logoWidth / (263 / 70), // Menjaga aspek rasio
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/img_logo_splash.png',
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
