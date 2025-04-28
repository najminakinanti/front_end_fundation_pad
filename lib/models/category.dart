import 'pivot.dart';

class Category {
  final int id;
  final String name;
  final int? parentId;
  final String icon;
  final Pivot pivot;

  Category({
    required this.id,
    required this.name,
    this.parentId,
    required this.icon,
    required this.pivot,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      parentId: json['parent_id'],
      icon: json['icon'],
      pivot: Pivot.fromJson(json['pivot']),
    );
  }
}
