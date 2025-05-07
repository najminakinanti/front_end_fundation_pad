import 'organizer.dart';
import 'event_photo.dart';
import 'event_category.dart';
import 'category.dart';
import 'event_fund.dart';
import 'event_placement.dart';
import 'sponsor.dart'; // Pastikan Anda sudah membuat model Sponsor.

class Event {
  final int id;
  final int organizersId;
  final String title;
  final String typeEvent;
  final String statusEvent;
  final int targetParticipant;
  final String description;
  final Organizer organizer;
  final List<EventPhoto> eventPhotos;
  final List<EventCategory> eventCategories;
  final List<Category> categories;
  final EventFund? eventFund;
  final EventPlacement? eventPlacement;
  final List<Sponsor> sponsors;
  final int clickCount;

  Event({
    required this.id,
    required this.organizersId,
    required this.title,
    required this.typeEvent,
    required this.statusEvent,
    required this.targetParticipant,
    required this.description,
    required this.organizer,
    required this.eventPhotos,
    required this.eventCategories,
    required this.categories,
    this.eventFund,
    this.eventPlacement,
    required this.sponsors,
    required this.clickCount,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      organizersId: json['organizers_id'],
      title: json['title'],
      typeEvent: json['type_event'],
      statusEvent: json['status_event'],
      targetParticipant: json['target_participant'],
      description: json['description'],
      organizer: Organizer.fromJson(json['organizer']),
      eventPhotos: (json['event_photos'] as List)
          .map((e) => EventPhoto.fromJson(e))
          .toList(),
      eventCategories: (json['event_categories'] as List)
          .map((e) => EventCategory.fromJson(e))
          .toList(),
      categories: (json['categories'] as List)
          .map((e) => Category.fromJson(e))
          .toList(),
      eventFund: json['event_fund'] != null
          ? EventFund.fromJson(json['event_fund'])
          : null,
      eventPlacement: json['event_placement'] != null
          ? EventPlacement.fromJson(json['event_placement'])
          : null,
      sponsors: (json['sponsors'] as List)
          .map((e) => Sponsor.fromJson(e))
          .toList(),
      clickCount: json['click_count'],
    );
  }
}