import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:watcha_pedia_clone/model/movie.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

class MovieSection extends StatelessWidget {
  final List<MovieModel> list;
  const MovieSection({required this.list, super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "현재상영중",
          style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 22, height: 1),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          child: CarouselSlider.builder(
              itemCount: (list.length / 3).round(),
              itemBuilder: (context, index, realIndex) {
                final int first = index * 3;
                final int second = first + 1;
                final int third = first + 2;
                return Row(
                  children: [first, second, third].map((idx) {
                    final item = list[idx];
                    return Expanded(
                        child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                                "https://media.themoviedb.org/t/p/original${item.posterPath}",
                                fit: BoxFit.fill),
                            const SizedBox(height: 5),
                            Text(
                              item.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  height: 1),
                            ),
                            Text(
                              "평점⭐${item.voteAverage}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  height: 1),
                            )
                          ]),
                    ));
                  }).toList(),
                );
              },
              options: CarouselOptions(
                  height: 211,
                  padEnds: false,
                  enlargeCenterPage: false,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  pageSnapping: false)),
        ),
      ],
    );
  }
}
