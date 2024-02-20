import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watcha_pedia_clone/model/video.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

class BoxSlider extends StatelessWidget {
  final List<VideoModel> list;
  final KeyEnum keyword;
  const BoxSlider({required this.list, required this.keyword, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(titleObject[keyword].toString(),
            style: GoogleFonts.notoSansKr(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              height: 1.25,
            )),
        SizedBox(height: 15),
        Container(
          height: 211,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: makeBoxWidget(list),
          ),
        ),
        SizedBox(height: 20),
      ]),
    );
  }
}

List<Widget> makeBoxWidget(List<VideoModel> list) {
  List<Widget> results = [];
  for (int i = 0; i < list.length; i++) {
    results.add(InkWell(
      onTap: () {},
      child: Container(
        width: 102,
        padding: EdgeInsets.only(right: 8),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                          "https://media.themoviedb.org/t/p/original${list[i].posterPath}",
                          fit: BoxFit.fill),
                    ),
                    Positioned(
                      left: 5,
                      bottom: 5,
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(50, 50, 50, 0.7),
                            borderRadius: BorderRadius.circular(4)),
                        child: Center(
                            child: Text(
                          (i + 1).toString(),
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  list[i].title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14,
                      height: 1.285,
                      color: Color.fromRGBO(41, 42, 50, 1)),
                ),
                SizedBox(
                  height: 4,
                ),
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
                      text: list[i].voteAverage.toString(),
                      style: const TextStyle(
                          fontSize: 14,
                          height: 1.07,
                          color: Color.fromRGBO(85, 87, 101, 1))),
                ]))
              ],
            )),
      ),
    ));
  }
  return results;
}
