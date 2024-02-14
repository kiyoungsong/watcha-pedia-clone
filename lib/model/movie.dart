class MovieModel {
  final int id;
  final String posterPath;
  final String title;
  final double voteAverage;

  const MovieModel({
    required this.id,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json["id"],
        posterPath: json["poster_path"],
        title: json["title"],
        voteAverage: json["vote_average"]);
  }
}
