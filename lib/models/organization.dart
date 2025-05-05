class Organization {
  final int id;
  final String name;
  final String address;
  final String description;
  final String city;
  final String province;
  final String photoFile;

  Organization({
    required this.id,
    required this.name,
    required this.address,
    required this.description,
    required this.city,
    required this.province,
    required this.photoFile,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      description: json['description'],
      city: json['city'],
      province: json['province'],
      photoFile: json['photo_file'],
    );
  }
}









