import 'package:pad_fundation/models/organization.dart';

class Organizer {
  final int id;
  final int userId;
  final int organizationId;
  final Organization organization;

  Organizer({
    required this.id,
    required this.userId,
    required this.organizationId,
    required this.organization,
  });

  factory Organizer.fromJson(Map<String, dynamic> json) {
    return Organizer(
      id: json['id'],
      userId: json['user_id'],
      organizationId: json['organization_id'],
      organization: Organization

          .fromJson(json['organization']),
    );
  }
}
