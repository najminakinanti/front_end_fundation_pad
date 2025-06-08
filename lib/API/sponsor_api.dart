import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/event.dart';
import '../models/sponsored_event.dart';
import 'api_service.dart';
import 'package:http/http.dart' as http;

class SponsorApi {

  static Future<List<SponsoredEvent>> getMySponsors(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      _showErrorDialog(context, 'Token tidak ditemukan. Harap login kembali.');
      return [];
    }

    final url = Uri.parse('${ApiService.baseUrl}/my-sponsors');

    try {
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        print("Response body: ${response.body}");
        final decoded = json.decode(response.body);
        final List data = decoded['sponsored_events'];
        return data
            .map((json) => SponsoredEvent.fromJson(json))
            .toList();
      } else {
        print("Gagal mengambil data sponsor. Status: ${response.statusCode}");
        _showErrorDialog(context, "Gagal mengambil data sponsor.");
        return [];
      }
    } catch (e) {
      print("Terjadi kesalahan: $e");
      _showErrorDialog(context, "Terjadi kesalahan: $e");
      return [];
    }
  }

  static void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Kesalahan'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          )
        ],
      ),
    );
  }
}