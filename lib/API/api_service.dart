import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://127.0.0.1:8000/api'; // Replace with your backend URL

  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      // Handle a successful response
      var data = jsonDecode(response.body);
      print(data);
      // Save tokens or do other actions with the response data
    } else {
      // Handle error
      throw Exception('Failed to login');
    }
  }
  // Future<void> register_organizer(String)
}
