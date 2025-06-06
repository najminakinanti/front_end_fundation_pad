import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_service.dart';

class LocationApi {
  static Future<List<dynamic>> fetchProvinces() async {
    final url = Uri.parse('${ApiService.baseUrl}/provinces');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Gagal mengambil data provinsi');
    }
  }

  static Future<List<dynamic>> fetchCities(String province) async {
    final encodedProvince = Uri.encodeComponent(province);
    final url = Uri.parse('${ApiService.baseUrl}/districts/$encodedProvince');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body) as List<dynamic>;
    } else {
      throw Exception('Gagal mengambil data kota');
    }
  }
}
