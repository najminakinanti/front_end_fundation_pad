class EventCategory {
  final int id;
  final int eventsId;
  final int eventCategoryNamesId;

  EventCategory({
    required this.id,
    required this.eventsId,
    required this.eventCategoryNamesId,
  });

  factory EventCategory.fromJson(Map<String, dynamic> json) {
    return EventCategory(
      id: json['id'],
      eventsId: json['events_id'],
      eventCategoryNamesId: json['event_category_names_id'],
    );
  }
}
