class EventPlacement {
  final int id;
  final int eventsId;
  final String eventStartDate;
  final String eventEndDate;
  final String eventVenue;
  final String address;
  final String city;
  final String province;

  EventPlacement({
    required this.id,
    required this.eventsId,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.eventVenue,
    required this.address,
    required this.city,
    required this.province,
  });

  factory EventPlacement.fromJson(Map<String, dynamic> json) {
    return EventPlacement(
      id: json['id'],
      eventsId: json['events_id'],
      eventStartDate: json['event_start_date'],
      eventEndDate: json['event_end_date'],
      eventVenue: json['event_venue'],
      address: json['address'],
      city: json['city'],
      province: json['province'],
    );
  }
}
