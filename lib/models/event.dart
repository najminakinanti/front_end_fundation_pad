import 'organizer.dart';
import 'event_photo.dart';
import 'category.dart';
import 'event_fund.dart';
import 'event_placement.dart';
import 'sponsor.dart';
import 'kontraprestasi.dart';

class Event {
  final int id;
  final int organizersId;
  final String title;
  final String typeEvent;
  final int targetParticipant;
  final String participantName;
  final String description;
  final int clickCount;
  final Organizer organizer;
  final List<EventPhoto> eventPhotos;
  final List<Category> categories;
  final EventFund? eventFund;
  final EventPlacement? eventPlacement;
  final List<Kontraprestasi> kontraprestasis;
  final List<Sponsor> sponsors;

  Event({
    required this.id,
    required this.organizersId,
    required this.title,
    required this.typeEvent,
    required this.targetParticipant,
    required this.participantName,
    required this.description,
    required this.clickCount,
    required this.organizer,
    required this.eventPhotos,
    required this.categories,
    this.eventFund,
    this.eventPlacement,
    required this.kontraprestasis,
    required this.sponsors,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      organizersId: json['organizers_id'],
      title: json['title'],
      typeEvent: json['type_event'],
      targetParticipant: json['target_participant'],
      participantName: json['participant_name'],
      description: json['description'],
      clickCount: json['click_count'] ?? 0,
      organizer: Organizer.fromJson(json['organizer']),
      eventPhotos: (json['event_photos'] as List<dynamic>?)
          ?.map((e) => EventPhoto.fromJson(e))
          .toList() ?? [],
      categories: (json['categories'] as List)
          .map((c) => Category.fromJson(c))
          .toList(),
      eventFund: json['event_fund'] != null
          ? EventFund.fromJson(json['event_fund'])
          : null,
      eventPlacement: json['event_placement'] != null
          ? EventPlacement.fromJson(json['event_placement'])
          : null,
      kontraprestasis: (json['kontraprestasis'] as List)
          .map((k) => Kontraprestasi.fromJson(k))
          .toList(),
      sponsors: (json['sponsors'] as List)
          .map((s) => Sponsor.fromJson(s))
          .toList(),
    );
  }
}
