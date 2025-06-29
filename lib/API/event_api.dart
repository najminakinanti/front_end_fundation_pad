import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pad_fundation/models/event.dart';
import 'package:pad_fundation/API/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme.dart';

class EventApi {

  static Future<List<Event>> fetchEvents() async {
    final String url = '${ApiService
        .baseUrl}/events/'; // Gunakan baseUrl dari ApiService
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Response sukses
      List jsonResponse = json.decode(response.body);
      print('Response body all event: ${response.body}');
      for (var data in jsonResponse) {
        print('Photo URL: ${data['event_photos']}');
      }
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
      m['event_photos'] = m['event_photos'] ?? <dynamic>[];
      m['event_categories'] = m['event_categories'] ?? <dynamic>[]; // <--- ini
      m['categories'] = m['categories'] ?? <dynamic>[];
      m['sponsors'] = m['sponsors'] ?? <dynamic>[];
      return m;
    }).toList();

    return fixed.map((m) => Event.fromJson(m)).toList();
  }

  static Future<List<Event>> getMyEvents() async {
    final url = '${ApiService.baseUrl}/myevents';

    // Ambil token dari SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      throw Exception('Token tidak ditemukan di SharedPreferences');
    }

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load events: ${response.statusCode}');
    }

    final raw = jsonDecode(response.body);
    if (raw is! List) return [];

    final fixed = raw.map<Map<String, dynamic>>((e) {
      final m = Map<String, dynamic>.from(e as Map);
      m['event_photos'] = m['event_photos'] ?? [];
      m['event_categories'] = m['event_categories'] ?? [];
      m['categories'] = m['categories'] ?? [];
      m['sponsors'] = m['sponsors'] ?? [];
      return m;
    }).toList();

    return fixed.map((m) => Event.fromJson(m)).toList();
  }

  static Future<List<Event>> fetchPopularEvents() async {
    final response = await http.get(
        Uri.parse('${ApiService.baseUrl}/events/popular'));

    if (response.statusCode != 200) {
      print('Request failed with status: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load events');
    }

    final raw = jsonDecode(response.body);
    if (raw is! List) return [];

    // Tambahkan default untuk semua key array yang di-fromJson
    final fixed = raw.map<Map<String, dynamic>>((e) {
      final m = Map<String, dynamic>.from(e as Map);
      m['event_photos'] = m['event_photos'] ?? <dynamic>[];
      m['event_categories'] = m['event_categories'] ?? <dynamic>[];
      m['categories'] = m['categories'] ?? <dynamic>[];
      m['sponsors'] = m['sponsors'] ?? <dynamic>[];
      return m;
    }).toList();

    return fixed.map((m) => Event.fromJson(m)).toList();
  }

  static Future<void> createEvent(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();

    try {
      // Ambil semua data dari SharedPreferences
      String? token = prefs.getString('token');

      String? title = prefs.getString('nama_event');
      String? typeEvent = prefs.getString('status_event');
      List<String>? eventCategories = prefs.getStringList('kategori_event');
      String? targetParticipantStr = prefs.getString('jumlah_target');
      int? target_participant = int.tryParse(targetParticipantStr ?? '');
      String? participant_name = prefs.getString('kategori_partisipan');
      String? description = prefs.getString('deskripsi_event');
      String? photo_file = prefs.getString('gambar_event_base64');
      List<String>? eventDetailImages = prefs.getStringList('gambar_detail_base64');

      String? event_venue = prefs.getString('venue_event');
      String? address = prefs.getString('alamat_event');
      String? city = prefs.getString('city');
      String? province = prefs.getString('province');
      String? event_start_date = prefs.getString('tanggal_mulai');
      String? event_end_date = prefs.getString('tanggal_akhir');

      String? targetFundStr = prefs.getString('target_donasi_sponsor');
      int? target_fund = int.tryParse(targetFundStr ?? '');
      String? sponsor_deadline = prefs.getString('sponsor_deadline');

      String? kontraprestasiJson = prefs.getString('kontraprestasi_list');
      List<Map<String, dynamic>>? kontraprestasiList;

      if (kontraprestasiJson != null) {
        try {
          kontraprestasiList =
          List<Map<String, dynamic>>.from(jsonDecode(kontraprestasiJson));
          print('Kontraprestasi List successfully parsed: $kontraprestasiList');
        } catch (e) {
          print('Gagal parsing kontraprestasi_list: $e');
          kontraprestasiList = [];
        }
      }

      // Cetak semua data untuk debugging
      print("====== DATA EVENT ======");
      print("token: $token");
      print("Title: $title");
      print("Type: $typeEvent");
      print("Categories: $eventCategories");
      print("Target Participants: $target_participant");
      print("Participant Name: $participant_name");
      print("Description: $description");
      print("Photo File (base64): ${photo_file}...");
      print("Detail Images: $eventDetailImages");

      print("Venue: $event_venue");
      print("Address: $address");
      print("City: $city");
      print("Province: $province");
      print("Start Date: $event_start_date");
      print("End Date: $event_end_date");

      print("Target Fund: $target_fund");
      print("Sponsor Deadline: $sponsor_deadline");

      print("Kontraprestasi List: $kontraprestasiList");
      print("List Foto Detail: $eventDetailImages");
      print("========================");

      final payload = {
        "event": {
          "title": title,
          "type_event": typeEvent,
          "target_participant": target_participant,
          "participant_name": participant_name,
          "description": description,
        },
        "event_photos": [
          {
            "photo_file": photo_file
          }
        ],
        "event_categories": eventCategories?.map((cat) {
          return {
            "event_category_names_id": int.tryParse(cat) ?? 0  // pastikan ID, bukan string nama
          };
        }).toList(),
        "event_fund": {
          "target_fund": target_fund,
          "sponsor_deadline": sponsor_deadline
        },
        "event_placement": {
          "event_start_date": event_start_date,
          "event_end_date": event_end_date,
          "event_venue": event_venue,
          "address": address,
          "city": city,
          "province": province,
        },
        "kontraprestasi": kontraprestasiList,
        "event_galeris": eventDetailImages?.map((img) {
          return {
            "photo_file": img,
          };
        }).toList() ?? [],
      };


      final response = await http.post(
        Uri.parse('https://backendfundation.my.id/api/create-events'),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Event berhasil dibuat!");
        print("Response body: ${response.body}");
        showSuccessDialog(context);
      } else {
        print("Gagal membuat event. Status: ${response.statusCode}");
        print("Response body: ${response.body}");
        _showErrorDialog(context, "Gagal membuat event: ${response.statusCode}");
      }

    } catch (e) {
      print("Error exception: $e");
      _showErrorDialog(context, "Terjadi kesalahan: $e");
    }
  }

  static Future<void> editEvent(BuildContext context, int eventId, Map<String, dynamic> updatedData) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.put(
      Uri.parse('https://backendfundation.my.id/api/events/$eventId'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
      body: jsonEncode(updatedData),
    );

    if (response.statusCode == 200) {
      print("Event berhasil diupdate!");
      showSuccessDialog2(context);
    } else {
      print("Gagal update event. Status: ${response.statusCode}");
      print("Response body: ${response.body}");
      _showErrorDialog(context, "Gagal update event: ${response.statusCode}");
    }
  }

  static Future<void> upsertKontraprestasi(int eventId, Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final url = Uri.parse('${ApiService.baseUrl}/kontraprestasi/$eventId');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode != 200) {
      print("Gagal menyimpan kontraprestasi. Status: ${response.statusCode}");
      print("Response body: ${response.body}");
      throw Exception('Gagal menyimpan kontraprestasi: ${response.body}');
    } else {
      print("Kontraprestasi berhasil diupsert.");
    }
  }

  static Future<List<Event>> getEventsforEdit(int eventId) async {
    final url = '${ApiService.baseUrl}/events-full/$eventId';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception('Failed to load events: ${response.statusCode}');
    }

    final raw = jsonDecode(response.body);
    if (raw is! List) return [];

    final fixed = raw.map<Map<String, dynamic>>((e) {
      final m = Map<String, dynamic>.from(e as Map);
      m['event_photos'] = m['event_photos'] ?? <dynamic>[];
      m['event_categories'] = m['event_categories'] ?? <dynamic>[]; // <--- ini
      m['categories'] = m['categories'] ?? <dynamic>[];
      m['sponsors'] = m['sponsors'] ?? <dynamic>[];
      return m;
    }).toList();

    return fixed.map((m) => Event.fromJson(m)).toList();
  }

  static Future<void> deleteEvent(BuildContext context, int eventId) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    if (token == null) {
      _showErrorDialog(context, 'Token tidak ditemukan. Harap login kembali.');
      return;
    }

    try {
      final response = await http.delete(
        Uri.parse('https://backendfundation.my.id/api/events/$eventId'),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        print("Event berhasil dihapus.");
      } else {
        print("Gagal menghapus event. Status: ${response.statusCode}");
        print("Response: ${response.body}");
        _showErrorDialog(context, "Gagal menghapus event: ${response.statusCode}");
      }
    } catch (e) {
      print("Error exception: $e");
      _showErrorDialog(context, "Terjadi kesalahan: $e");
    }
  }

  static Future<void> incrementClick(int eventId) async {
    const baseUrl = 'https://backendfundation.my.id'; // Ganti sesuai IP backend jika di device
    final response = await http.post(
      Uri.parse('$baseUrl/api/events/$eventId/click'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode != 200) {
      print('Failed to increment click count: ${response.statusCode}');
      print('Response body: ${response.body}');
    } else {
      print('Click count incremented for event $eventId');
    }

  }

  static void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  static void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'Event berhasil ditambahkan!',
            style: blackTextStyle.copyWith(fontSize: 12, fontWeight: regular),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/home-organizer', arguments: 1); // Atau navigasi sesuai kebutuhanmu
              },
              child: Text(
                'OK',
                style: navyTextStyle.copyWith(fontSize: 12, fontWeight: bold),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        );
      },
    );
  }

  static void showSuccessDialog2(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'Event berhasil diperbarui!',
            style: blackTextStyle.copyWith(fontSize: 12, fontWeight: regular),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/home-organizer', arguments: 1); // Atau navigasi sesuai kebutuhanmu
              },
              child: Text(
                'OK',
                style: navyTextStyle.copyWith(fontSize: 12, fontWeight: bold),
              ),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        );
      },
    );
  }

  Future<List<String>> fetchEventGallery(String eventId) async {
    final url = Uri.parse('${ApiService.baseUrl}/events/galeri/$eventId');
    print('Fetching from URL: $url');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print('Response JSON: $json');

      final List<dynamic> dataList = json['data'];

      // Convert relative paths to full URLs
      List<String> imageUrls = dataList
          .map((item) => '${ApiService.photourl}${item['photo_file']}')
          .cast<String>()
          .toList();

      return imageUrls;
    } else {
      print('Error response code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load gallery');
    }
  }


}
