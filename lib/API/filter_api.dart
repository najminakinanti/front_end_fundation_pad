import 'dart:convert';

import '../models/event.dart';
import 'package:http/http.dart' as http;

class FilterApi {
  static Future<List<Event>> fetchFilteredEvents({
    required List<int> categoryIds,
    required String? fundRange,
  }) async {
    print('✅ fetchFilteredEvents() called with:');
    print('   categoryIds: $categoryIds');
    print('   fundRange: $fundRange');

    // Build query parameters
    final queryParams = {
      for (var id in categoryIds) 'category_id[]': id.toString(),
      if (fundRange != null) 'fund_range': fundRange,
    };

    final uri = Uri.https('backendfundation.my.id', '/api/filter-events', queryParams);

    print('🌐 Requesting: $uri');

    final response = await http.get(
      uri,
      headers: {
        'Accept': 'application/json',
      },
    );

    print('🔁 Response status: ${response.statusCode}');
    print('📦 Response body: ${response.body}');

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Event.fromJson(e)).toList();
    } else {
      throw Exception('Failed to fetch filtered events (${response.statusCode})');
    }
  }
}
