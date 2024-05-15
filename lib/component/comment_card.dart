import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:watcha_pedia_clone/model/detail.dart';
import 'package:watcha_pedia_clone/model/info.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

class CommentCard extends StatelessWidget {
  final String id;
  final AuthorDetailModel detailModel;
  final String content;
  final DateTime createdAt;
  final MovieInfo movieInfo;
  const CommentCard({
    super.key,
    required this.id,
    required this.detailModel,
    required this.content,
    required this.createdAt,
    required this.movieInfo,
  });
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.all(12),
        width: 350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: const Color.fromRGBO(242, 242, 242, 1)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromRGBO(217, 217, 217, 1),
                          child: detailModel.avatarPath != null
                              ? Image.network(
                                  "https://media.themoviedb.org/t/p/original${detailModel.avatarPath}",
                                  fit: BoxFit.cover,
                                )
                              : SvgPicture.asset(
                                  "$baseAssetPath/user.svg",
                                  fit: BoxFit.fill,
                                  width: 16,
                                  height: 16,
                                  colorFilter: const ColorFilter.mode(
                                      Color.fromRGBO(107, 107, 107, 1),
                                      BlendMode.srcIn),
                                ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(detailModel.username)
                    ]),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: 26,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
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
                      Text(detailModel.rating.toString())
                    ]),
                  )
                ],
              ),
            ),
            const Divider(
              height: 1,
              thickness: 1,
              color: Color.fromRGBO(229, 229, 229, 1),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push("/comments/detail/$id",
                          extra: CommentDetailInfo(
                              title: movieInfo.title,
                              id: movieInfo.id,
                              posterPath: movieInfo.posterPath,
                              releaseDate: movieInfo.releaseDate,
                              isMovie: movieInfo.isMovie,
                              content: content,
                              authorDetailModel: AuthorDetailModel(
                                  username: detailModel.username,
                                  avatarPath: detailModel.avatarPath,
                                  rating: detailModel.rating),
                              createdAt: createdAt,
                              commentId: id));
                    },
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        content,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 10,
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
