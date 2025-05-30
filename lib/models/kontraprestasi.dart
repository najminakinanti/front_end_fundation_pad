  class Kontraprestasi {
    int? id;
    int? iconPhotoKontraprestasisId;
    int? eventsId;
    String? title;
    int? minSponsor;
    int? maxSponsor;
    String? feedback;

    Kontraprestasi({
      this.id,
      this.iconPhotoKontraprestasisId,
      this.eventsId,
      this.title,
      this.minSponsor,
      this.maxSponsor,
      this.feedback,
    });

    factory Kontraprestasi.fromJson(Map<String, dynamic> json) {
      return Kontraprestasi(
        id: json['id'],
        iconPhotoKontraprestasisId: json['icon_photo_kontraprestasis_id'],
        eventsId: json['events_id'],
        title: json['title'],
        minSponsor: json['min_sponsor'],
        maxSponsor: json['max_sponsor'],
        feedback: json['feedback'],
      );
    }

    Map<String, dynamic> toJson() {
      return {
        'id': id,
        'icon_photo_kontraprestasis_id': iconPhotoKontraprestasisId,
        'events_id': eventsId,
        'title': title,
        'min_sponsor': minSponsor,
        'max_sponsor': maxSponsor,
        'feedback': feedback ?? '',
      };
    }
  }
