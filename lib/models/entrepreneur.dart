import 'mitra.dart';

class Entrepreneur {
  final int id;
  final int userId;
  final int mitraId;
  final Mitra mitra;

  Entrepreneur({
    required this.id,
    required this.userId,
    required this.mitraId,
    required this.mitra,
  });

  factory Entrepreneur.fromJson(Map<String, dynamic> json) {
    return Entrepreneur(
      id: json['id'],
      userId: json['user_id'],
      mitraId: json['mitra_id'],
      mitra: Mitra.fromJson(json['mitra']),
    );
  }
}
