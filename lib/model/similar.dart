class SimilarModel {
  final int id;
  final String? poster;
  final String title;
  final double voteAverage;
  final DateTime? releaseDate;

  const SimilarModel(
      {required this.id,
      required this.poster,
      required this.title,
      required this.voteAverage,
      required this.releaseDate});
  static List<SimilarModel> fromJson(List<dynamic> e) {
    final base = e.take(12);

    return base
        .map((json) => SimilarModel(
            id: json["id"],
            poster: json["poster_path"],
            title: json["title"],
            voteAverage: json["vote_average"],
            releaseDate: json["release_date"] != ""
                ? DateTime.parse(json["release_date"])
                : null))
        .toList();
  }
}
