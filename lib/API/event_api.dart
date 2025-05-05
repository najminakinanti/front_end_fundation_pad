import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pad_fundation/models/event.dart';
import 'package:pad_fundation/API/api_service.dart';

class EventApi {
  static Future<List<Event>> fetchEvents() async {
    final String url = '${ApiService.baseUrl}/events/'; // Gunakan baseUrl dari ApiService
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Response sukses
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Event.fromJson(data)).toList();
    } else {
      // Periksa status code dan body untuk debugging
      print('Request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load events');
    }

  }

  static Future<List<Event>> getEventsByCategory(int categoryId) async {
    final url = '${ApiService.baseUrl}/events/by-category/$categoryId';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load events: ${response.statusCode}');
    }

    final raw = jsonDecode(response.body);
    if (raw is! List) return [];

    // Tambahkan default untuk semua key array yang di-fromJson
    final fixed = raw.map<Map<String, dynamic>>((e) {
      final m = Map<String, dynamic>.from(e as Map);
      m['event_photos']     = m['event_photos']     ?? <dynamic>[];
      m['event_categories'] = m['event_categories'] ?? <dynamic>[];  // <--- ini
      m['categories']       = m['categories']       ?? <dynamic>[];
      m['sponsors']         = m['sponsors']         ?? <dynamic>[];
      return m;
    }).toList();

    return fixed.map((m) => Event.fromJson(m)).toList();
  }


// static Future<List<Event>> getEventsByCategory(int categoryId) async {
//   final String url = '${ApiService.baseUrl}/events/by-category/$categoryId'; // Gunakan baseUrl dari ApiService
//   final response = await http.get(Uri.parse(url));
//   print('Request URL: $url');
//   if (response.statusCode == 200) {
//     List jsonData = jsonDecode(response.body);
//     return jsonData.map((e) => Event.fromJson(e)).toList();
//   } else {
//     throw Exception('Failed to load events');
//   }
// }
}

