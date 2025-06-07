class KontraprestasiEvidence {
  final int id;
  final int sponsorsId;
  final String photoFile;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;

  KontraprestasiEvidence({
    required this.id,
    required this.sponsorsId,
    required this.photoFile,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  factory KontraprestasiEvidence.fromJson(Map<String, dynamic> json) {
    print('Parsing evidence: ${json['photo_file']}');
    return KontraprestasiEvidence(
      id: json['id'],
      sponsorsId: int.tryParse(json['sponsors_id'].toString()) ?? 0,
      photoFile: json['photo_file'],
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sponsors_id': sponsorsId,
      'photo_file': photoFile,
      'description': description,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
