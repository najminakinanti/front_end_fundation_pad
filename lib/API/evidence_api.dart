import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pad_fundation/API/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/kontraprestasi_evidences.dart';
class EvidenceApi {

  static const String photourl = '${ApiService.photourl}';

  static Future<List<KontraprestasiEvidence>> getEvidencesBySponsorId(int sponsorId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token tidak ditemukan. Harap login kembali.');
    }

    final url = Uri.parse('${ApiService.baseUrl}/evidences/sponsor/$sponsorId');
    print('Fetching evidences from: $url');

    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      try {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        final List<dynamic> evidencesJson = jsonMap['evidences'] ?? [];
        print('Evidences count: ${evidencesJson.length}');
        return evidencesJson.map((e) => KontraprestasiEvidence.fromJson(e)).toList();
      } catch (e) {
        print('Parsing error: $e');
        throw Exception('Error parsing evidences JSON: $e');
      }
    } else {
      throw Exception('Failed to load evidences. Status code: ${response.statusCode}');
    }
  }

}
