class PropertyTemplate {
  int level;
  String id;
  bool active;
  String displayName;
  String imageUrl;

  PropertyTemplate(
      {required this.displayName,
      required this.id,
      required this.active,
      required this.level,
      required this.imageUrl});

  factory PropertyTemplate.fromJson(Map<String, dynamic> json) {
    return PropertyTemplate(
        displayName: json['display_name'],
        id: json['_id'],
        active: json['active'],
        level: json['level'],
        imageUrl: json['image_url']);
  }
}
