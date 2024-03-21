import 'package:flutter/material.dart';

class DetailOverview extends StatelessWidget {
  final int voteCount;
  final int voteAverage;
  final String tagline;
  final String overView;
  const DetailOverview(
      {super.key,
      required this.voteCount,
      required this.voteAverage,
      required this.tagline,
      required this.overView});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(248, 248, 248, 1),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Column(children: [
                    const Text(
                      "평균 점수",
                      style: TextStyle(color: Color.fromRGBO(140, 140, 140, 1)),
                    ),
                    Text(
                        "(${voteCount > 10000 ? '${(voteCount / 10000).toStringAsFixed(1)}만' : voteCount.toString()}명)",
                        style: const TextStyle(
                            color: Color.fromRGBO(140, 140, 140, 1)))
                  ]),
                ),
                const SizedBox(width: 20),
                Text(
                  "${voteAverage.toString()}점",
                  style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(140, 140, 140, 1)),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 40),
            child: Divider(
              height: 1,
              thickness: 1,
              color: Color.fromRGBO(217, 217, 217, 1),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (tagline != "")
                  Text(
                    "\"$tagline\"",
                    style: const TextStyle(
                        color: Color.fromRGBO(140, 140, 140, 1)),
                  ),
                if (tagline != "")
                  const SizedBox(
                    height: 20,
                  ),
                Text(
                  overView,
                  style: const TextStyle(
                    color: Color.fromRGBO(140, 140, 140, 1),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
