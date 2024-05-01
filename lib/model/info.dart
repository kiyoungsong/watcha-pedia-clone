import 'package:watcha_pedia_clone/model/detail.dart';

class MovieInfo {
  final String id;
  final String posterPath;
  final DateTime releaseDate;
  final bool isMovie;
  final String title;

  const MovieInfo(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.releaseDate,
      required this.isMovie});
}

class CommentDetailInfo extends MovieInfo {
  final String commentId;
  final String content;
  final AuthorDetailModel authorDetailModel;
  final DateTime createdAt;

  const CommentDetailInfo(
      {required this.commentId,
      required this.content,
      required this.authorDetailModel,
      required this.createdAt,
      required super.id,
      required super.title,
      required super.posterPath,
      required super.releaseDate,
      required super.isMovie});
}
