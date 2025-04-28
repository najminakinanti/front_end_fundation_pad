class EventFund {
  final int id;
  final int eventsId;
  final int targetFund;
  final String sponsorDeadline;

  EventFund({
    required this.id,
    required this.eventsId,
    required this.targetFund,
    required this.sponsorDeadline,
  });

  factory EventFund.fromJson(Map<String, dynamic> json) {
    return EventFund(
      id: json['id'],
      eventsId: json['events_id'],
      targetFund: json['target_fund'],
      sponsorDeadline: json['sponsor_deadline'],
    );
  }
}
