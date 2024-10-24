import 'package:flutter/material.dart';
import 'package:pad_fundation/mitra_page/forgot_password_mitra.dart';
import 'package:pad_fundation/mitra_page/forgot_password_new_password_mitra.dart';
import 'package:pad_fundation/mitra_page/forgot_password_verification_mitra.dart';
import 'package:pad_fundation/mitra_page/home/main_page.dart';
import 'package:pad_fundation/mitra_page/login_page_mitra.dart';
import 'package:pad_fundation/mitra_page/register_page_mitra.dart';
import 'package:pad_fundation/mitra_page/register_page_mitra_add.dart';
import 'package:pad_fundation/organizer_page/forgot_password_new_password_organizer.dart';
import 'package:pad_fundation/organizer_page/forgot_password_organizer.dart';
import 'package:pad_fundation/organizer_page/forgot_password_verification_organizer.dart';
import 'package:pad_fundation/organizer_page/login_page_organizer.dart';
import 'package:pad_fundation/organizer_page/register_page_organizer.dart';
import 'package:pad_fundation/organizer_page/register_page_organizer_add.dart';
import 'package:pad_fundation/splash_screen/splash_page.dart';
import 'package:pad_fundation/splash_screen/on_boarding_page_1.dart';
import 'package:pad_fundation/splash_screen/on_boarding_page_2.dart';
import 'package:pad_fundation/splash_screen/on_boarding_page_3.dart';

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
        '/boarding-2': (context) => OnBoardingPage2(),
        '/boarding-3': (context) => OnBoardingPage3(),

        // role mitra
        '/login-mitra': (context) => LoginPageMitra(),
        '/forgot-password': (context) => ForgotPasswordMitra(),
        '/verification': (context) => VerificationMitra(),
        '/new-password': (context) => NewPasswordMitra(),
        '/register-mitra': (context) => RegisterPageMitra(),
        '/add-mitra': (context) => AddMitra(),
        '/home': (context) => MainPage(),

        //role organizer
        '/login-organizer': (context) => LoginPageOrganizer(),
        '/forgot-password-organizer': (context) => ForgotPasswordOrganizer(),
        '/verification-organizer': (context) => VerificationOrganizer(),
        '/new-password-organizer': (context) => NewPasswordOrganizer(),
        '/register-organizer': (context) => RegisterPageOrganizer(),
        '/add-organizer': (context) => AddOrganizer(),
      },
    );
  }
}
