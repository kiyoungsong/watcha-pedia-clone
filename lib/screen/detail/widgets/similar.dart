import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:watcha_pedia_clone/model/similar.dart';

class DetailSimilar extends StatelessWidget {
  final List<SimilarModel> similar;

  const DetailSimilar({super.key, required this.similar});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "비슷한 작품",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 14,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 13,
                childAspectRatio: 0.42),
            itemBuilder: (context, index) {
              final poster = similar[index].poster;
              return SizedBox(
                child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push('/detail/${similar[index].id}');
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        poster != null
                            ? Image.network(
                                "https://media.themoviedb.org/t/p/original$poster",
                                fit: BoxFit.fitWidth)
                            : Expanded(
                                child: Container(
                                color: Colors.grey[300],
                              )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          similar[index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14,
                              height: 1.285,
                              color: Color.fromRGBO(41, 42, 50, 1)),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        RichText(
                            text: TextSpan(children: [
                          const TextSpan(
                              text: "평점 ",
                              style: TextStyle(
                                  fontSize: 14,
                                  height: 1.07,
                                  color: Color.fromRGBO(85, 87, 101, 1))),
                          const WidgetSpan(
                              child: Icon(
                            Icons.star,
                            size: 15,
                          )),
                          TextSpan(
                              text: similar[index].voteAverage.toString(),
                              style: const TextStyle(
                                  fontSize: 14,
                                  height: 1.07,
                                  color: Color.fromRGBO(85, 87, 101, 1))),
                        ])),
                        Text(similar[index].releaseDate != null
                            ? DateFormat('yyyy-MM-dd')
                                .format(similar[index].releaseDate!)
                            : ""),
                      ],
                    )),
              );
            },
            itemCount: similar.length,
          )
        ],
      ),
    );
  }
}
