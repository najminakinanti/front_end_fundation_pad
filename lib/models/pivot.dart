class Pivot {
  final int eventsId;
  final int eventCategoryNamesId;

  Pivot({
    required this.eventsId,
    required this.eventCategoryNamesId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) {
    return Pivot(
      eventsId: json['events_id'],
      eventCategoryNamesId: json['event_category_names_id'],
    );
  }
}
