import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watcha_pedia_clone/screen/detail/widgets/comment.dart';
import 'package:watcha_pedia_clone/screen/detail/widgets/credit.dart';
import 'package:watcha_pedia_clone/screen/detail/widgets/gallery.dart';
import 'package:watcha_pedia_clone/screen/detail/widgets/header.dart';
import 'package:watcha_pedia_clone/screen/detail/widgets/overview.dart';
import 'package:watcha_pedia_clone/screen/detail/widgets/recommendation.dart';
import 'package:watcha_pedia_clone/screen/detail/widgets/similar.dart';
import 'package:watcha_pedia_clone/screen/detail/widgets/teaser.dart';
import 'package:watcha_pedia_clone/service/detail_service.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = GoRouterState.of(context).pathParameters["id"] ?? "0";
    final item = DetailService().getDetail(int.parse(id));
    return FutureBuilder(
        future: item,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final info = snapshot.data!;
            return ListView(
              children: [
                DetailHeader(
                  backdropPath: info.backdropPath,
                  title: info.title,
                  originTitle: info.originTitle,
                  releaseDate: info.releaseDate,
                  productionCountries: info.productionCountries,
                  genres: info.genres,
                  runTime: info.runTime,
                ),
                DetailOverview(
                  voteCount: info.voteCount,
                  voteAverage: info.voteAverage,
                  tagline: info.tagline,
                  overView: info.overView,
                ),
                DetailCredit(
                  cast: info.cast,
                ),
                DetailComment(
                  review: info.review,
                ),
                const SizedBox(
                  height: 20,
                ),
                DetailGallery(images: info.images),
                DetailTeaser(teasers: info.teasers),
                if (info.recommendation.isNotEmpty)
                  DetailRecommendation(
                    recommendation: info.recommendation,
                  ),
                DetailSimilar(
                  similar: info.similar,
                )
              ],
            );
          }
        });
  }
}
