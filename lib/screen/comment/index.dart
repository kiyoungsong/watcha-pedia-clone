import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watcha_pedia_clone/model/info.dart';
import 'package:watcha_pedia_clone/screen/comment/widgets/content.dart';
import 'package:watcha_pedia_clone/service/review_service.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  @override
  Widget build(BuildContext context) {
    final id = GoRouterState.of(context).pathParameters["id"] ?? "0";
    final movieInfo = GoRouterState.of(context).extra as MovieInfo;
    return FutureBuilder(
      future: ReviewService().getReview(int.parse(id)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error : ${snapshot.error}');
        } else {
          return CommentContent(
            review: snapshot.data ?? [],
            movieInfo: movieInfo,
          );
        }
      },
    );
  }
}
