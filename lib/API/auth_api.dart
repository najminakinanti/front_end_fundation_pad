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

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        String? token = data['data']['token'];
        String? role = data['data']['user']['role'];

        print('Token yang diterima: $token');
        print('Role yang diterima: $role');

        if (token == null || role == null) {
          _showErrorDialog(context, 'Terjadi kesalahan. Data login tidak lengkap.');
          return;
        }

        if (role == 'entrepreneur') {
          await _saveUserSession(token, role);

          // Cek apakah SharedPreferences sudah menyimpan dengan benar
          final prefs = await SharedPreferences.getInstance();
          String? savedToken = prefs.getString('token');
          String? savedRole = prefs.getString('role');
          print('Token di SharedPreferences: $savedToken');
          print('Role di SharedPreferences: $savedRole');

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
      print('Error saat login: $e');
      _showErrorDialog(context, 'Periksa koneksi internet Anda atau coba lagi nanti.');
    }
  }

  static Future<void> loginOrganizer(String email, String password, BuildContext context) async {
    try {
      final response = await ApiService.post('login', {
        'email': email,
        'password': password,
      });

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        String? token = data['data']['token'];
        String? role = data['data']['user']['role'];

        print('Token yang diterima: $token');
        print('Role yang diterima: $role');

        if (token == null || role == null) {
          _showErrorDialog(context, 'Terjadi kesalahan. Data login tidak lengkap.');
          return;
        }

        if (role == 'organizer') {
          await _saveUserSession(token, role);

          // Cek apakah SharedPreferences sudah menyimpan dengan benar
          final prefs = await SharedPreferences.getInstance();
          String? savedToken = prefs.getString('token');
          String? savedRole = prefs.getString('role');
          print('Token di SharedPreferences: $savedToken');
          print('Role di SharedPreferences: $savedRole');

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
      print('Error saat login: $e');
      _showErrorDialog(context, 'Periksa koneksi internet Anda atau coba lagi nanti.');
    }
  }

  static Future<void> logout(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token'); // Ambil token dari SharedPreferences

      print('Token sebelum logout: $token');
      print('Role sebelum logout: ${prefs.getString('role')}');

      if (token != null) {
        // Kirim request logout ke backend dengan header Authorization
        final response = await ApiService.post(
            'logout',
            {},
            headers: {
              'Authorization': 'Bearer $token', // Tambahkan token ke header
            }
        );

        if (response.statusCode == 200) {
          print('Logout berhasil di backend');
        } else {
          print('Logout gagal di backend: ${response.body}');
        }
      } else {
        print('Token tidak ditemukan, logout lokal saja.');
      }

      // Hapus data lokal setelah logout sukses
      bool isCleared = await prefs.clear();
      print('SharedPreferences cleared: $isCleared');
      print('Token setelah logout: ${prefs.getString('token')}');
      print('Role setelah logout: ${prefs.getString('role')}');

      // Navigasi ke halaman ChooseRole setelah logout
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ChooseRole()),
      );
    } catch (e) {
      print('Error saat logout: $e');
    }
  }

  static Future<void> _saveUserSession(String token, String role) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      await prefs.setString('role', role);
      print('Data berhasil disimpan di SharedPreferences');
    } catch (e) {
      print('Gagal menyimpan data ke SharedPreferences: $e');
    }
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
