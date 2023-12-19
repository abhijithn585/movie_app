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
      name: json['name'],
      original_name: json['original_name'],
      character: json['character'],
      known_for_department: json['known_for_department'],
      profile_path: json['profile_path'],
    );
  }
}
