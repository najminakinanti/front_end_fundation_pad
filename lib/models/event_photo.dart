import 'package:pad_fundation/API/profile_api.dart';

import '../API/api_service.dart';

class EventPhoto {
  final int id;
  final int eventsId;
  final String photoFile;

  EventPhoto({
    required this.id,
    required this.eventsId,
    required this.photoFile,
  });

  factory EventPhoto.fromJson(Map<String, dynamic> json) {
    final String url = '${ProfileApi.photourl}'; // Gunakan baseUrl dari ApiService

    print('Base URL: $url');

    return EventPhoto(
      id: json['id'],
      eventsId: json['events_id'],
      photoFile: url + json['photo_file'], // Gabungkan base URL dengan path foto
    );

  }

}
