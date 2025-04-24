import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileApi {
  static const String photourl= 'http://10.0.2.2:8000/';
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  // API untuk mengambil data user menggunakan token
  static Future<Map<String, dynamic>?> getUserForm(String token) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/user-form'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Gagal ambil data user-form: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error saat get user-form: $e');
      return null;
    }
  }

// API untuk mengambil data profil pengguna berdasarkan userId
  static Future<Map<String, dynamic>?> getUserProfile(int? userId, String token) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/user-form/$userId'),  // Endpoint API untuk data profil
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);  // Mengembalikan data profil pengguna
      } else {
        print('Gagal ambil data user-profile: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error saat get user-profile: $e');
      return null;
    }
  }

  //ambil data mitra
  static Future<Map<String, dynamic>?> getMitraProfile(int userId, String token) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/mitra/$userId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Gagal ambil data mitra: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error saat get mitra: $e');
      return null;
    }
  }

  //ambil data organizer
  static Future<Map<String, dynamic>?> getOrganizerProfile(int userId, String token) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/organization/$userId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Gagal ambil data organizer: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Error saat get organizer: $e');
      return null;
    }
  }
}