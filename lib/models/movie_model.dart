class MovieModel {
  String? title;
  String? original_title;
  String? original_language;
  int? id;
  String? backdrop_path;
  String? overview;
  String? poster_path;
  String? media_type;
  String? release_date;
  double? vote_average;
  int? vote_count;
  double? popularity;
  String? name;

  MovieModel({
    required this.title,
    required this.original_title,
    required this.original_language,
    required this.id,
    required this.backdrop_path,
    required this.overview,
    required this.poster_path,
    required this.media_type,
    required this.release_date,
    required this.vote_average,
    required this.vote_count,
    required this.popularity,
    required this.name,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json['title'],
      original_title: json["original_title"],
      original_language: json["original_language"],
      id: json["id"],
      backdrop_path: json["backdrop_path"],
      overview: json["overview"],
      poster_path: json["poster_path"],
      media_type: json["media_type"],
      release_date: json["release_date"],
      vote_average: json["vote_average"],
      vote_count: json["vote_count"],
      popularity: json["popularity"],
      name: json["name"],
    );
  }
}
