class Sponsor {
  final int id;
  final int eventId;
  final int entrepreneurId;
  final double amount;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Sponsor({
    required this.id,
    required this.eventId,
    required this.entrepreneurId,
    required this.amount,
    this.createdAt,
    this.updatedAt,
  });

  factory Sponsor.fromJson(Map<String, dynamic> json) {
    return Sponsor(
      id: json['id'],
      eventId: json['event_id'],
      entrepreneurId: json['entrepreneur_id'],
      amount: (json['amount'] as num).toDouble(),
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null,
    );
  }
}
