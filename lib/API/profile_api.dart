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

  static Future<bool> putUserForm(String userid, String token, Map<String, dynamic> data) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/user-form/$userid'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        // 200 OK atau 204 No Content berarti sukses update
        return true;
      } else {
        print('Gagal update user-form: ${response.statusCode} - ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error saat update user-form: $e');
      return false;
    }
  }

  // update data mitra
  static Future<bool> putMitraProfile(int userId, String token, Map<String, dynamic> data) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/mitra-enrollment/$userId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        print('Berhasil update data mitra');
        return true;
      } else {
        print('Gagal update data mitra: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error saat update mitra: $e');
      return false;
    }
  }

  // update data organizer
  static Future<bool> putOrganizerProfile(int userId, String token, Map<String, dynamic> data) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/organization-enrollment/$userId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        print('✅ Berhasil update data organizer');
        return true;
      } else {
        print('❌ Gagal update data organizer: ${response.body}');
        return false;
      }
    } catch (e) {
      print('🚨 Error saat update organizer: $e');
      return false;
    }
  }

}