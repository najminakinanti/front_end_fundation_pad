import 'package:pad_fundation/models/event.dart';
import 'package:pad_fundation/models/kontraprestasi_evidences.dart';
import 'package:pad_fundation/models/sponsor.dart';

class SponsoredEvent {
  final Event event;
  final Sponsor sponsor;
  final List<KontraprestasiEvidence> evidences;

  SponsoredEvent({
    required this.event,
    required this.sponsor,
    required this.evidences,
  });

  factory SponsoredEvent.fromJson(Map<String, dynamic> json) {
    return SponsoredEvent(
      event: Event.fromJson(json['event']),
      sponsor: Sponsor.fromJson(json['sponsor']),
      evidences: (json['evidences'] as List<dynamic>?)
          ?.map((e) => KontraprestasiEvidence.fromJson(e))
          .toList() ??
          [],
    );
  }
}
