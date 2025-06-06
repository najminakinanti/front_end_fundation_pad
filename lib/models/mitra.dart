class Mitra {
  final int id;
  final String name;
  final String address;
  final String city;
  final String province;
  final String photoFile;
  final String? description;

  Mitra({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.province,
    required this.photoFile,
    this.description,
  });

  factory Mitra.fromJson(Map<String, dynamic> json) {
    return Mitra(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      city: json['city'],
      province: json['province'],
      photoFile: json['photo_file'],
      description: json['description'],
    );
  }
}
