import 'package:watcha_pedia_clone/model/image.dart';

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
  List<CastModel> cast = [];
  List<ReviewModel> review = [];
  List<ImageModel> images = [];

  DetailModel({
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

class CastModel {
  final int id;
  final String name;
  final String? profilePath;
  final int castId;
  final String character;
  final String creditId;

  const CastModel({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
  });

  static List<CastModel> fromJson(List<dynamic> jsonList) {
    final result = jsonList
        .map((e) => CastModel(
              id: e['id'],
              name: e['name'],
              profilePath: e['profile_path'],
              castId: e['cast_id'],
              character: e['character'],
              creditId: e['credit_id'],
            ))
        .toList();
    return result;
  }
}

class ReviewModel {
  final String id;
  final String content;
  final AuthorDetailModel authorDetailModel;
  final DateTime createdAt;

  const ReviewModel({
    required this.id,
    required this.content,
    required this.authorDetailModel,
    required this.createdAt,
  });
  static List<ReviewModel> formJson(List<dynamic> jsonList) {
    final result = jsonList
        .map((e) => ReviewModel(
            id: e["id"],
            content: e["content"],
            authorDetailModel: AuthorDetailModel(
                username: e["author_details"]["username"],
                avatarPath: e["author_details"]["avatar_path"],
                rating: e["author_details"]["rating"]),
            createdAt: DateTime.parse(e["created_at"])))
        .toList();
    return result;
  }
}

class AuthorDetailModel {
  final String username;
  final String? avatarPath;
  final double rating;

  const AuthorDetailModel(
      {required this.username, required this.avatarPath, required this.rating});

  factory AuthorDetailModel.fromJson(Map<String, dynamic> json) {
    return AuthorDetailModel(
        username: json["username"],
        avatarPath: json["avatar_path"],
        rating: json["rating"]);
  }
}
