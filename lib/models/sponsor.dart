import 'entrepreneur.dart';
import 'kontraprestasi_evidences.dart';

class Sponsor {
  final int id;
  final int eventId;
  final int entrepreneurId;
  final double amount;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Entrepreneur? entrepreneur;
  final List<KontraprestasiEvidence> evidences;

  Sponsor({
    required this.id,
    required this.eventId,
    required this.entrepreneurId,
    required this.amount,
    this.createdAt,
    this.updatedAt,
    this.entrepreneur,
    List<KontraprestasiEvidence>? evidences,
  }) : evidences = evidences ?? [];

  factory Sponsor.fromJson(Map<String, dynamic> json) {
    return Sponsor(
      id: json['id'],
      eventId: json['event_id'],
      entrepreneurId: json['entrepreneur_id'],
      amount: (json['amount'] as num).toDouble(),
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
      entrepreneur: json['entrepreneur'] != null
          ? Entrepreneur.fromJson(json['entrepreneur'])
          : null,
      evidences: (json['evidences'] as List<dynamic>?)
          ?.map((e) => KontraprestasiEvidence.fromJson(e))
          .toList() ?? [],
    );
  }

  @override
  String toString() {
    return '''
Sponsor:
  id: $id
  eventId: $eventId
  entrepreneurId: $entrepreneurId
  amount: $amount
  createdAt: $createdAt
  updatedAt: $updatedAt
  entrepreneur: ${entrepreneur != null ? entrepreneur.toString() : 'null'}
  evidences:
    ${evidences.isNotEmpty ? evidences.map((e) => e.toString()).join('\n    ') : 'No evidences'}
''';
  }
}
