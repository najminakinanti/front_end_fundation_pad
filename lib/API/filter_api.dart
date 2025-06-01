import 'dart:convert';

import '../models/event.dart';
import 'package:http/http.dart' as http;

class FilterApi {
  static Future<List<Event>> fetchFilteredEvents({
    required List<int> categoryIds,
    required String? fundRange,
  }) async {
    final url = Uri.parse('https://yourapi.com/api/filter-events');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'category_id': categoryIds,
        'fund_range': fundRange,
      }),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Event.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch filtered events (${response.statusCode})');
    }
  }

}