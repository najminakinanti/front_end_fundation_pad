import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pad_fundation/pages/mitra_page/home_mitra/main_page_mitra.dart';
import 'package:pad_fundation/pages/organizer_page/home_organizer/main_page_organizer.dart';


class ApiService {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  static Future<http.Response> post(
      String endpoint,
      Map<String, dynamic> body, {
        Map<String, String>? headers, // Pastikan headers bisa diterima sebagai opsional
      }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          if (headers != null) ...headers, // Tambahkan headers jika ada
        },
        body: jsonEncode(body),
      );
      return response;
    } catch (e) {
      print('Error saat melakukan request: $e');
      rethrow;
    }
  }
}


