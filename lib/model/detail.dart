class GenreModel {
  final int id;
  final String name;

  const GenreModel({required this.id, required this.name});
  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(id: json["id"], name: json["name"]);
  }
}

class ProductionCountryModel {
  final String language;
  final String country;

  const ProductionCountryModel({required this.language, required this.country});
  factory ProductionCountryModel.fromJson(Map<String, dynamic> json) {
    return ProductionCountryModel(
        language: json["iso_3166_1"], country: json["name"]);
  }
}

class DetailModel {
  final int id;
  final String title;
  final List<GenreModel> genres;
  final String overView;
  final String posterPath;
  final String originTitle;
  final int runTime;
  final String tagline;
  final int voteAverage;
  final String language;
  final String? backdropPath;
  final DateTime releaseDate;
  final List<ProductionCountryModel> productionCountries;
  final int voteCount;

  const DetailModel({
    required this.id,
    required this.title,
    required this.genres,
    required this.overView,
    required this.posterPath,
    required this.originTitle,
    required this.runTime,
    required this.tagline,
    required this.voteAverage,
    required this.language,
    required this.backdropPath,
    required this.releaseDate,
    required this.productionCountries,
    required this.voteCount,
  });

  factory DetailModel.fromJson(Map<String, dynamic> json) {
    return DetailModel(
        id: json["id"].toInt(),
        title: json["title"],
        genres: List<GenreModel>.from(
            json["genres"].map((x) => GenreModel.fromJson(x))),
        overView: json["overview"],
        posterPath: json["poster_path"],
        originTitle: json["original_title"],
        runTime: json["runtime"].toInt(),
        tagline: json["tagline"],
        voteAverage: (json["vote_average"] * 10).toInt(),
        language: json["original_language"],
        backdropPath: json["backdrop_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        productionCountries: List<ProductionCountryModel>.from(
            json["production_countries"]
                .map((x) => ProductionCountryModel.fromJson(x))),
        voteCount: json["vote_count"].toInt());
  }
}
