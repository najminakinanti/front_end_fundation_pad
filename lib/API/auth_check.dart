import 'package:flutter/material.dart';
import 'package:pad_fundation/pages/mitra_page/home_mitra/main_page_mitra.dart';
import 'package:pad_fundation/pages/organizer_page/home_organizer/main_page_organizer.dart';
import 'package:pad_fundation/pages/splash_screen/choose_role.dart';
import 'package:pad_fundation/pages/splash_screen/on_boarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String?>>(
      future: _getStoredCredentials(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData && snapshot.data != null) {
          String? token = snapshot.data?['token'];
          String? role = snapshot.data?['role'];

          // Debugging output
          print('Token: $token');
          print('Role: $role');

          if (token == null || token.isEmpty) {
            // Jika token kosong, langsung ke SplashPage
            return OnBoardingPageView();
          } else if (role == 'entrepreneur') {
            return MainPageMitra();
          } else if (role == 'organizer') {
            return MainPageOrganizer();
          }
        }

        return ChooseRole();
      },
    );
  }

  Future<Map<String, String?>> _getStoredCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'token': prefs.getString('token') ?? '', // Pastikan tidak null
      'role': prefs.getString('role') ?? '',
    };
  }
}
