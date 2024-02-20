class VideoModel {
  final int id;
  final String posterPath;
  final String title;
  final double voteAverage;

  const VideoModel({
    required this.id,
    required this.posterPath,
    required this.title,
    required this.voteAverage,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
        id: json["id"],
        posterPath: json["poster_path"],
        title: json["title"] ?? json["name"],
        voteAverage: json["vote_average"]);
  }
}
