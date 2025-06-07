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

  static Future<List<KontraprestasiEvidence>> addEvidencesBySponsorId(int sponsorId, List<Map<String, dynamic>> evidencesData) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token tidak ditemukan. Harap login kembali.');
    }

    final url = Uri.parse('${ApiService.baseUrl}/kontraprestasi-evidences/$sponsorId');
    print('Posting evidences to: $url');

    // Jangan tambahkan sponsors_id di sini, karena sudah di endpoint
    final body = jsonEncode({
      "evidences": evidencesData,
    });

    final response = await http.post(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: body,
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      try {
        final Map<String, dynamic> jsonMap = jsonDecode(response.body);
        final List<dynamic> evidencesJson = jsonMap['data'] ?? [];
        return evidencesJson.map((e) => KontraprestasiEvidence.fromJson(e)).toList();
      } catch (e) {
        print('Parsing error: $e');
        throw Exception('Error parsing evidences JSON: $e');
      }
    } else {
      throw Exception('Failed to add evidences. Status code: ${response.statusCode}');
    }
  }

  static Future<void> upsertEvidences(int sponsorId, List<Map<String, dynamic>> evidences) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token tidak ditemukan. Harap login kembali.');
    }

    final url = Uri.parse('${ApiService.baseUrl}/evidences/upsert/$sponsorId');
    print('Mengirim POST request ke: $url');
    print('Payload: ${json.encode({'evidences': evidences})}');

    final response = await http.post(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: json.encode({'evidences': evidences}),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode != 200) {
      throw Exception('Gagal mengirim data. Kode status: ${response.statusCode}');
    }
  }
}
