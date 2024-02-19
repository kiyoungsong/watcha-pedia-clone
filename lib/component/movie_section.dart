import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watcha_pedia_clone/model/movie.dart';
import 'package:watcha_pedia_clone/service/meta.dart';
import 'package:watcha_pedia_clone/service/movie_list_service.dart';

class MovieSection extends StatelessWidget {
  final List<MovieModel> list;
  final KeyEnum keyword;
  const MovieSection({required this.list, required this.keyword, super.key});

  @override
  Widget build(BuildContext context) {
    int imageCount = (list.length / 3).round();
    // 사이즈
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleObject[keyword].toString(),
            style: GoogleFonts.notoSansKr(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              height: 1.25,
            )),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          child: CarouselSlider.builder(
              itemCount: imageCount,
              itemBuilder: (context, index, realIndex) {
                final int first = index * 3;
                final int? second = index <= imageCount - 1 ? first + 1 : null;
                final int? third = index <= imageCount - 2 ? first + 2 : null;

                List<int?> lengthArray = [first, second, third];

                return Row(
                  children: lengthArray.map((idx) {
                    if (idx != null) {
                      final item = list[idx];
                      return Expanded(
                          child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.network(
                                        "https://media.themoviedb.org/t/p/original${item.posterPath}",
                                        fit: BoxFit.fill),
                                  ),
                                  Positioned(
                                    left: 5,
                                    bottom: 5,
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              50, 50, 50, 0.7),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      child: Center(
                                          child: Text(
                                        (idx + 1).toString(),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Text(
                                item.title,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 14,
                                    height: 1.285,
                                    color: Color.fromRGBO(41, 42, 50, 1)),
                              ),
                              const SizedBox(height: 4),
                              RichText(
                                  text: TextSpan(children: [
                                const TextSpan(
                                    text: "평점 ",
                                    style: const TextStyle(
                                        fontSize: 14,
                                        height: 1.07,
                                        color: Color.fromRGBO(85, 87, 101, 1))),
                                WidgetSpan(
                                    child: Icon(
                                  Icons.star,
                                  size: 15,
                                )),
                                TextSpan(
                                    text: item.voteAverage.toString(),
                                    style: const TextStyle(
                                        fontSize: 14,
                                        height: 1.07,
                                        color: Color.fromRGBO(85, 87, 101, 1))),
                              ])),
                            ]),
                      ));
                    } else {
                      return const Expanded(
                        child: SizedBox(),
                      );
                    }
                  }).toList(),
                );
              },
              options: CarouselOptions(
                  aspectRatio: 1.4,
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
