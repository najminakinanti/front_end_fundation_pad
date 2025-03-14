import 'package:flutter/material.dart';
import 'package:pad_fundation/pages/mitra_page/home_mitra/main_page_mitra.dart';
import 'package:pad_fundation/pages/organizer_page/home_organizer/main_page_organizer.dart';
import 'package:pad_fundation/pages/splash_screen/choose_role.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCheck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _getStoredRole(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasData) {
          String? role = snapshot.data;
          if (role == 'entrepreneur') {
            return MainPageMitra();
          } else if (role == 'organizer') {
            return MainPageOrganizer();
          }
        }

        return ChooseRole();
      },
    );
  }

  Future<String?> _getStoredRole() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('role');
  }
}
