import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watcha_pedia_clone/model/detail.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

class CommentCard extends StatelessWidget {
  final String id;
  final AuthorDetailModel detailModel;
  final String content;
  final DateTime createdAt;
  const CommentCard({
    super.key,
    required this.id,
    required this.detailModel,
    required this.content,
    required this.createdAt,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: 350,
      height: 290,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Color.fromRGBO(242, 242, 242, 1)),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(children: [
                    SizedBox(
                      width: 30,
                      height: 30,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(217, 217, 217, 1),
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
                  padding: EdgeInsets.symmetric(horizontal: 8),
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
            child: Center(
              child: Text(
                content,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
              ),
            ),
          )
        ],
      ),
    );
  }
}
