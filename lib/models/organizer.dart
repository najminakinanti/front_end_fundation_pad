class Organizer {
  final int id;
  final int userId;
  final int organizationId;

  Organizer({
    required this.id,
    required this.userId,
    required this.organizationId,
  });

  factory Organizer.fromJson(Map<String, dynamic> json) {
    return Organizer(
      id: json['id'],
      userId: json['user_id'],
      organizationId: json['organization_id'],
    );
  }
}
