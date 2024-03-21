import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:watcha_pedia_clone/model/detail.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

class DetailHeader extends StatelessWidget {
  final String? backdropPath;
  final String title;
  final String originTitle;
  final DateTime releaseDate;
  final List<ProductionCountryModel> productionCountries;
  final List<GenreModel> genres;
  final int runTime;

  const DetailHeader(
      {super.key,
      required this.backdropPath,
      required this.title,
      required this.originTitle,
      required this.releaseDate,
      required this.productionCountries,
      required this.genres,
      required this.runTime});
  @override
  Widget build(BuildContext context) {
    return (SizedBox(
      width: double.maxFinite,
      height: 550,
      child: Stack(children: [
        SizedBox(
          height: double.infinity,
          child: backdropPath != null
              ? Image.network(
                  "https://media.themoviedb.org/t/p/original$backdropPath",
                  fit: BoxFit.cover,
                )
              : Container(
                  color: Colors.grey,
                ),
        ),
        SizedBox(
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              GoRouter.of(context).pop();
                            },
                            icon: SvgPicture.asset(
                                "$baseAssetPath/arrow_left.svg")),
                      ),
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              print("공유");
                            },
                            icon: SvgPicture.asset("$baseAssetPath/share.svg")),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 36,
                            height: 1.2,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        originTitle,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 14, height: 1.2),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${releaseDate.year} • ${productionCountries.last.country}",
                        style: const TextStyle(
                            color: Colors.white, fontSize: 14, height: 1.2),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        genres.map((e) => e.name).join(", "),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 14, height: 1.2),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "${runTime ~/ 60}시간 ${runTime % 60}분",
                        style: const TextStyle(
                            color: Colors.white, fontSize: 14, height: 1.2),
                      ),
                    ],
                  ),
                )
              ],
            ))
      ]),
    ));
  }
}
