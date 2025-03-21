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
        Map<String, String>? headers,
        String? token,
      }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
          if (headers != null) ...headers,
        },
        body: jsonEncode(body),
      );
      return response;
    } catch (e) {
      print('Error saat melakukan request: $e');
      rethrow;
    }
  }
  static Future<http.Response> postFormData(
      String endpoint,
      Map<String, String> fields, {
        Map<String, String>? headers,
        // Jika perlu upload file, tambahkan parameter file dan fileField
        // File? file,
        // String fileField = 'file',
      }) async {
    var uri = Uri.parse('$baseUrl/$endpoint');
    var request = http.MultipartRequest('POST', uri);

    // Tambahkan fields form-data
    request.fields.addAll(fields);

    // Tambahkan header jika diperlukan
    if (headers != null) {
      request.headers.addAll(headers);
    }

    // Jika ingin mengirim file, gunakan kode berikut:
    // if (file != null) {
    //   request.files.add(await http.MultipartFile.fromPath(fileField, file.path));
    // }

    // Kirim request dan tunggu respons
    var streamedResponse = await request.send();
    return await http.Response.fromStream(streamedResponse);
  }
}
