import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:watcha_pedia_clone/model/info.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

class CommentDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CommentDetailInfo reviewModel =
        GoRouterState.of(context).extra as CommentDetailInfo;
    return CustomScrollView(slivers: [
      SliverAppBar(
          pinned: true,
          toolbarHeight: 45,
          centerTitle: true,
          title: const Text(
            "코멘트",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          surfaceTintColor: Colors.white,
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0.08), width: 2.0)))),
          leading: SizedBox(
            height: 24,
            width: 24,
            child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  if (GoRouter.of(context).canPop()) {
                    GoRouter.of(context).pop();
                  }
                },
                icon: SvgPicture.asset(
                  "$baseAssetPath/arrow_left.svg",
                  colorFilter: const ColorFilter.mode(
                      Color.fromRGBO(255, 47, 99, 1), BlendMode.srcIn),
                )),
          )),
      SliverToBoxAdapter(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    SizedBox(
                      width: 18,
                      height: 18,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(217, 217, 217, 1),
                        child: reviewModel.authorDetailModel.avatarPath != null
                            ? Image.network(
                                "https://media.themoviedb.org/t/p/original${reviewModel.authorDetailModel.avatarPath}",
                                fit: BoxFit.cover,
                              )
                            : SvgPicture.asset(
                                "$baseAssetPath/user.svg",
                                fit: BoxFit.fill,
                                width: 12,
                                height: 12,
                                colorFilter: const ColorFilter.mode(
                                    Color.fromRGBO(107, 107, 107, 1),
                                    BlendMode.srcIn),
                              ),
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      reviewModel.authorDetailModel.username,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      getDatedifference(reviewModel.createdAt),
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(120, 120, 120, 1)),
                    ),
                  ]),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    reviewModel.title,
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    child: Row(children: [
                      Text(
                        reviewModel.isMovie ? "영화" : "TV",
                        style: const TextStyle(
                            color: Color.fromRGBO(120, 120, 120, 1)),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        "•",
                        style:
                            TextStyle(color: Color.fromRGBO(120, 120, 120, 1)),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        reviewModel.releaseDate.year.toString(),
                        style: const TextStyle(
                            color: Color.fromRGBO(120, 120, 120, 1)),
                      )
                    ]),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(
                            width: 1,
                            color: const Color.fromRGBO(201, 201, 201, 1))),
                    child: Row(children: [
                      SvgPicture.asset(
                        "$baseAssetPath/star.svg",
                        fit: BoxFit.fill,
                        width: 16,
                        height: 16,
                        colorFilter: const ColorFilter.mode(
                            Color.fromRGBO(107, 107, 107, 1), BlendMode.srcIn),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(reviewModel.authorDetailModel.rating.toString())
                    ]),
                  ),
                ],
              ),
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                      "https://media.themoviedb.org/t/p/original${reviewModel.posterPath}",
                      width: 70,
                      height: 104,
                      fit: BoxFit.fill),
                ),
              )
            ]),
            const SizedBox(
              height: 20,
            ),
            Text(reviewModel.content)
          ],
        ),
      ))
    ]);
  }
}

String getDatedifference(DateTime createdAt) {
  Duration difference = DateTime.now().difference(createdAt);

  int days = difference.inDays;
  int weeks = (days / 7).floor();
  int months = (days / 30).floor();
  int years = (days / 365).floor();

  if (years > 0) {
    return "$years년 전";
  }

  if (months > 0) {
    return "$months개월 전";
  }

  if (weeks > 0) {
    return "$weeks 전";
  }

  return "$days일 전";
}
