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
}

