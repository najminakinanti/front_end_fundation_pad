import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pad_fundation/api/api_service.dart';
import 'package:pad_fundation/pages/mitra_page/home_mitra/main_page_mitra.dart';
import 'package:pad_fundation/pages/organizer_page/home_organizer/main_page_organizer.dart';
import 'package:pad_fundation/pages/splash_screen/choose_role.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthApi {
  static Future<void> loginMitra(String email, String password, BuildContext context) async {
    try {
      final response = await ApiService.post('login', {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        String? token = data['data']['token'];
        String? role = data['data']['user']['role'];

        if (role == 'entrepreneur') {
          await _saveUserSession(token ?? '', role ?? '');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPageMitra()),
          );
        } else {
          _showErrorDialog(context, 'Login gagal! Hanya Mitra yang dapat masuk.');
        }
      } else {
        var errorData = jsonDecode(response.body);
        _showErrorDialog(context, errorData['message']);
      }
    } catch (e) {
      _showErrorDialog(context, 'Periksa koneksi internet Anda atau coba lagi nanti.');
    }
  }

  static Future<void> loginOrganizer(String email, String password, BuildContext context) async {
    try {
      final response = await ApiService.post('login', {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        String? token = data['data']['token'];
        String? role = data['data']['user']['role'];

        if (role == 'organizer') {
          await _saveUserSession(token ?? '', role ?? '');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPageOrganizer()),
          );
        } else {
          _showErrorDialog(context, 'Login gagal! Hanya Organizer yang dapat masuk.');
        }
      } else {
        var errorData = jsonDecode(response.body);
        _showErrorDialog(context, errorData['message']);
      }
    } catch (e) {
      _showErrorDialog(context, 'Periksa koneksi internet Anda atau coba lagi nanti.');
    }
  }

  static Future<void> logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('role');

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => ChooseRole()),
          (route) => false,
    );
  }


  static Future<void> _saveUserSession(String? token, String? role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token ?? ''); // Jika null, ubah menjadi string kosong
    await prefs.setString('role', role ?? '');   // Jika null, ubah menjadi string kosong
  }

  static void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Login Gagal'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
