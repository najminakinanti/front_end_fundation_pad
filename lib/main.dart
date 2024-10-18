import 'package:flutter/material.dart';
import 'package:pad_fundation/splash_screen/splash_page.dart';
import 'package:pad_fundation/splash_screen/on_boarding_page_1.dart';
import 'package:pad_fundation/splash_screen/on_boarding_page_2.dart'; // Import OnBoardingPage2
import 'package:pad_fundation/splash_screen/on_boarding_page_3.dart'; // Import OnBoardingPage3
import 'theme.dart'; // Import your theme

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Route configuration for navigating between pages
      routes: {
        '/': (context) => SplashPage(),
        '/boarding-1': (context) => OnBoardingPage1(),
        '/boarding-2': (context) => OnBoardingPage2(), // Add the route for OnBoardingPage2
        '/boarding-3': (context) => OnBoardingPage3(), // Add the route for OnBoardingPage3
      },
    );
  }
}
