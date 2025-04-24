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
        var user_id = data['data']['user']['user_id'];  // Handle this as a dynamic type

        // If user_id is an int, convert it to a string
        String userIdString = user_id.toString();

        print('Token yang diterima: $token');
        print('Role yang diterima: $role');
        print('Id yang diterima: $userIdString');  // Use the string version of user_id

        if (token == null || role == null || userIdString.isEmpty) {
          _showErrorDialog(context, 'Terjadi kesalahan. Data login tidak lengkap.');
          return;
        }

        if (role == 'entrepreneur') {
          await _saveUserSession(token, role, userIdString);

          // Cek apakah SharedPreferences sudah menyimpan dengan benar
          final prefs = await SharedPreferences.getInstance();
          String? savedToken = prefs.getString('token');
          String? savedRole = prefs.getString('role');
          String? savedId = prefs.getString('user_id');
          print('Token di SharedPreferences: $savedToken');
          print('id di SharedPreferences: $savedId');
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
        var user_id = data['data']['user']['user_id'];  // Handle this as a dynamic type

        // If user_id is an int, convert it to a string
        String userIdString = user_id.toString();

        print('Token yang diterima: $token');
        print('Role yang diterima: $role');
        print('Id yang diterima: $userIdString');  // Use the string version of user_id

        if (token == null || role == null || userIdString.isEmpty) {
          _showErrorDialog(context, 'Terjadi kesalahan. Data login tidak lengkap.');
          return;
        }

        if (role == 'organizer') {
          await _saveUserSession(token, role, userIdString);

          // Cek apakah SharedPreferences sudah menyimpan dengan benar
          final prefs = await SharedPreferences.getInstance();
          String? savedToken = prefs.getString('token');
          String? savedRole = prefs.getString('role');
          String? savedId = prefs.getString('user_id');
          print('Token di SharedPreferences: $savedToken');
          print('Role di SharedPreferences: $savedRole');
          print('ID di SharedPreferences: $savedId');

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

  static Future<void> registerMitra(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    // Ambil data yang telah disimpan dari kedua form
    String? fullName = prefs.getString('full_name');
    String? email = prefs.getString('email');
    String? phone = prefs.getString('phone');
    String? password = prefs.getString('password');
    String? name = prefs.getString('name');
    String? address = prefs.getString('address');
    String? description = prefs.getString('description');
    String? province = prefs.getString('province');
    String? city = prefs.getString('city');
    String? photo_file = prefs.getString('photo_file');

    print('Full Name: $fullName');
    print('Email: $email');
    print('Phone: $phone');
    print('Password: $password');
    print('Mitra Name: $name');
    print('Address: $address');
    print('Description: $description');
    print('Province: $province');
    print('City: $city');
    print('Image (base64): $photo_file');


    if (fullName == null || email == null || phone == null || password == null || name == null || address == null || description == null) {
      _showErrorDialog(context, "Data tidak lengkap. Silakan isi semua form.");
      return;
    }

    try {
      print("📤 Mengirim request ke API: register-entrepreneur...");
      print("➡ Data: {full_name: $fullName, email: $email, phone: $phone, password: $password}");

      final userResponse = await ApiService.post(
        'register-entrepreneur',
        {
          "full_name": fullName,
          "email": email,
          "phone": phone,
          "password": password,
          "role": "entrepreneur",
        },
        headers: {
          "Accept": "application/json",
        },
      );


      print("📥 Response API (register-entrepreneur): ${userResponse.statusCode}");
      print("🔍 Response body: ${userResponse.body}");

      if (userResponse.statusCode == 201) {
        final userData = jsonDecode(userResponse.body);
        int? userId = userData['data']['user']['id']; // Ambil user_id
        String? token = userData['data']['token']; // Ambil token untuk request berikutnya

        if (userId == null) {
          _showErrorDialog(context, "Gagal mendapatkan User ID atau Token.");
          return;
        }
        print("User ID: $userId");
        print("Mengirim request ke API: mitra-form/$userId...");

        final mitraResponse = await ApiService.postFormData(
          'mitra-form/$userId',
          {
            "name": name,
            "address": address,
            "description": description,
            "province": province!,
            "city": city!,
            "photo_file": photo_file!,
          },
            headers: {
              "Accept": "application/json",
          }
          // token: token, // Kirim token sebagai Authorization header

        );
        print("Response API (mitra-form/$userId): ${mitraResponse.statusCode}");
        print("Response body: ${mitraResponse.body}");

        if (mitraResponse.statusCode == 200) {
          print("Registrasi Mitra sukses!");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPageMitra()),
          );
        } else {
          var errorData = jsonDecode(mitraResponse.body);
          _showErrorDialog(context, errorData['message'] ?? "Registrasi Mitra gagal!");
        }
      } else {
        var errorData = jsonDecode(userResponse.body);
        _showErrorDialog(context, errorData['message'] ?? "Registrasi User gagal!");
      }
    } catch (e) {
      print("Error saat registrasi: $e");
      _showErrorDialog(context, "Terjadi kesalahan. Silakan coba lagi.");
    }
  }

  static void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  static Future<void> registerOrganizer(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    // Ambil data yang telah disimpan dari kedua form
    String? fullName = prefs.getString('full_name');
    String? email = prefs.getString('email');
    String? phone = prefs.getString('phone');
    String? password = prefs.getString('password');
    String? name = prefs.getString('name');
    String? address = prefs.getString('address');
    String? description = prefs.getString('description');
    String? province = prefs.getString('province');
    String? city = prefs.getString('city');
    String? photo_file = prefs.getString('photo_file');

    print('Full Name: $fullName');
    print('Email: $email');
    print('Phone: $phone');
    print('Password: $password');
    print('Mitra Name: $name');
    print('Address: $address');
    print('Description: $description');
    print('Province: $province');
    print('City: $city');
    print('Image (base64): $photo_file');


    if (fullName == null || email == null || phone == null || password == null || name == null || address == null || description == null) {
      _showErrorDialog(context, "Data tidak lengkap. Silakan isi semua form.");
      return;
    }

    try {
      print("📤 Mengirim request ke API: register-entrepreneur...");
      print("➡ Data: {full_name: $fullName, email: $email, phone: $phone, password: $password}");

      final userResponse = await ApiService.post(
        'register-organizer',
        {
          "full_name": fullName,
          "email": email,
          "phone": phone,
          "password": password,
          "role": "entrepreneur",
        },
        headers: {
          "Accept": "application/json",
        },
      );

      print("📥 Response API (register-organizer): ${userResponse.statusCode}");
      print("🔍 Response body: ${userResponse.body}");

      if (userResponse.statusCode == 201) {
        final userData = jsonDecode(userResponse.body);
        int? userId = userData['data']['user']['id'];
        String? token = userData['data']['token'];

        if (userId == null) {
          _showErrorDialog(context, "Gagal mendapatkan User ID atau Token.");
          return;
        }
        print("User ID: $userId");
        print("Mengirim request ke API: organizer-form/$userId...");

        final mitraResponse = await ApiService.postFormData(
            'organizer-form/$userId',
            {
              "name": name,
              "address": address,
              "description": description,
              "province": province!,
              "city": city!,
              "photo_file": photo_file!,
            },
            headers: {
              "Accept": "application/json",
            }
          // token: token, // Kirim token sebagai Authorization header

        );
        print("Response API (organizer-form/$userId): ${mitraResponse.statusCode}");
        print("Response body: ${mitraResponse.body}");

        if (mitraResponse.statusCode == 200) {
          print("Registrasi Organizer sukses!");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainPageOrganizer()),
          );
        } else {
          var errorData = jsonDecode(mitraResponse.body);
          _showErrorDialog(context, errorData['message'] ?? "Registrasi Organizer gagal!");
        }
      } else {
        var errorData = jsonDecode(userResponse.body);
        _showErrorDialog(context, errorData['message'] ?? "Registrasi User gagal!");
      }
    } catch (e) {
      print("Error saat registrasi: $e");
      _showErrorDialog(context, "Terjadi kesalahan. Silakan coba lagi.");
    }
  }

  static Future<void> _saveUserSession(String token, String role, String user_id) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      await prefs.setString('user_id', user_id);
      await prefs.setString('role', role);
      print('Data berhasil disimpan di SharedPreferences');
    } catch (e) {
      print('Gagal menyimpan data ke SharedPreferences: $e');
    }
  }
}
