import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:watcha_pedia_clone/model/detail.dart';
import 'package:watcha_pedia_clone/model/info.dart';
import 'package:watcha_pedia_clone/screen/detail/widgets/comment.dart';
import 'package:watcha_pedia_clone/screen/detail/widgets/credit.dart';
import 'package:watcha_pedia_clone/screen/detail/widgets/gallery.dart';
import 'package:watcha_pedia_clone/screen/detail/widgets/header.dart';
import 'package:watcha_pedia_clone/screen/detail/widgets/overview.dart';
import 'package:watcha_pedia_clone/screen/detail/widgets/recommendation.dart';
import 'package:watcha_pedia_clone/screen/detail/widgets/similar.dart';
import 'package:watcha_pedia_clone/screen/detail/widgets/teaser.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

class DetailList extends StatefulWidget {
  final DetailModel info;
  const DetailList({super.key, required this.info});

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  final ScrollController scrollController = ScrollController();
  bool _isTop = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_handleScrollEvent);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _handleScrollEvent() {
    final isTop = scrollController.offset < 50;
    if (isTop != _isTop) {
      setState(() {
        _isTop = isTop;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final id = GoRouterState.of(context).pathParameters["id"] ?? "0";
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverStack(children: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                DetailHeader(
                  backdropPath: widget.info.backdropPath,
                  title: widget.info.title,
                  originTitle: widget.info.originTitle,
                  releaseDate: widget.info.releaseDate,
                  productionCountries: widget.info.productionCountries,
                  genres: widget.info.genres,
                  runTime: widget.info.runTime,
                ),
                DetailOverview(
                  voteCount: widget.info.voteCount,
                  voteAverage: widget.info.voteAverage,
                  tagline: widget.info.tagline,
                  overView: widget.info.overView,
                ),
                DetailCredit(
                  cast: widget.info.cast,
                ),
                DetailComment(
                  review: widget.info.review,
                  movieInfo: MovieInfo(
                      id: widget.info.id.toString(),
                      title: widget.info.title,
                      posterPath: widget.info.posterPath,
                      releaseDate: widget.info.releaseDate,
                      isMovie: true),
                ),
                const SizedBox(
                  height: 20,
                ),
                DetailGallery(images: widget.info.images),
                DetailTeaser(teasers: widget.info.teasers),
                if (widget.info.recommendation.isNotEmpty)
                  DetailRecommendation(
                    recommendation: widget.info.recommendation,
                  ),
                DetailSimilar(
                  similar: widget.info.similar,
                )
              ],
            ),
          ),
          SliverAppBar(
            pinned: true,
            title: _isTop ? null : Text(widget.info.title),
            backgroundColor: _isTop ? Colors.transparent : Colors.white,
            expandedHeight: 57,
            leading: SizedBox(
              height: 24,
              width: 24,
              child: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    if (GoRouter.of(context).canPop()) {
                      GoRouter.of(context).pop();
                    } else {
                      GoRouter.of(context).go("/");
                    }
                  },
                  icon: SvgPicture.asset(
                    "$baseAssetPath/arrow_left.svg",
                    colorFilter: ColorFilter.mode(
                        _isTop ? Colors.white : Colors.black, BlendMode.srcIn),
                  )),
            ),
            actions: [
              SizedBox(
                height: 24,
                width: 24,
                child: IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {
                      print("공유");
                    },
                    icon: SvgPicture.asset(
                      "$baseAssetPath/share.svg",
                      colorFilter: ColorFilter.mode(
                          _isTop ? Colors.white : Colors.black,
                          BlendMode.srcIn),
                    )),
              ),
              const SizedBox(
                width: 16,
              ),
            ],
          )
        ])
      ],
    );
  }
}
