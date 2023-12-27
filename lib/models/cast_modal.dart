class CastModel {
  String? name;
  String? original_name;
  String? profile_path;
  String? character;
  String? known_for_department;
  CastModel(
      {required this.name,
      required this.original_name,
      required this.character,
      required this.known_for_department,
      required this.profile_path});

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      name: json['name'] ?? "no data",
      original_name: json['original_name'] ?? "no data",
      character: json['character'] ?? "no data",
      known_for_department: json['known_for_department'] ?? "no data",
      profile_path: json['profile_path'] ?? "no data",
    );
  }
}
