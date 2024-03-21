import 'package:flutter/material.dart';
import 'package:watcha_pedia_clone/component/comment_card.dart';
import 'package:watcha_pedia_clone/model/detail.dart';

class DetailComment extends StatelessWidget {
  final List<ReviewModel> review;

  const DetailComment({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
          child: Column(
        children: [
          SizedBox(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "코멘트",
                        style: TextStyle(
                            height: 1,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        review.length.toString(),
                        style: const TextStyle(
                            height: 1,
                            fontSize: 24,
                            color: Color.fromRGBO(255, 47, 110, 1)),
                      )
                    ]),
              ),
              const Text(
                "더보기",
                style: TextStyle(
                    height: 1,
                    fontSize: 16,
                    color: Color.fromRGBO(255, 47, 110, 1)),
              )
            ],
          )),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 290,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: getReviews(review),
            ),
          ),
        ],
      )),
    );
  }
}

List<Widget> getReviews(List<ReviewModel> list) {
  List<Widget> result = [];

  for (int i = 0; i < list.length; i++) {
    result.add(CommentCard(
        id: list[i].id,
        detailModel: list[i].authorDetailModel,
        content: list[i].content,
        createdAt: list[i].createdAt));
    if (i < list.length - 1) {
      result.add(const SizedBox(
        width: 20,
      ));
    }
  }
  return result;
}
