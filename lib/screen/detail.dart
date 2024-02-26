import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:watcha_pedia_clone/service/detail_service.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final id = GoRouterState.of(context).pathParameters["id"] ?? "0";
    final item = DetailService().getDetail(int.parse(id));
    return FutureBuilder(
        future: item,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            final info = snapshot.data!;
            return ListView(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  height: 550,
                  child: Stack(children: [
                    SizedBox(
                      height: double.infinity,
                      child: info.backdropPath != null
                          ? Image.network(
                              "https://media.themoviedb.org/t/p/original${info.backdropPath}",
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
                              padding: EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                        onPressed: () {
                                          GoRouter.of(context).go("/");
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
                                        icon: SvgPicture.asset(
                                            "$baseAssetPath/share.svg")),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, bottom: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    info.title,
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
                                    info.originTitle,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        height: 1.2),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${info.releaseDate.year} • ${info.productionCountries.last.country}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        height: 1.2),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    info.genres.map((e) => e.name).join(", "),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        height: 1.2),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    "${info.runTime ~/ 60}시간 ${info.runTime % 60}분",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        height: 1.2),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ))
                  ]),
                ),
                Container(
                  color: Color.fromRGBO(248, 248, 248, 1),
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
                                  style: TextStyle(
                                      color: Color.fromRGBO(140, 140, 140, 1)),
                                ),
                                Text(
                                    "(${info.voteCount > 10000 ? '${(info.voteCount / 10000).toStringAsFixed(1)}만' : info.voteCount.toString()}명)",
                                    style: const TextStyle(
                                        color:
                                            Color.fromRGBO(140, 140, 140, 1)))
                              ]),
                            ),
                            const SizedBox(width: 20),
                            Text(
                              "${info.voteAverage.toString()}점",
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
                            Text(
                              "\"${info.tagline}\"",
                              style: const TextStyle(
                                  color: Color.fromRGBO(140, 140, 140, 1)),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              info.overView,
                              style: const TextStyle(
                                color: Color.fromRGBO(140, 140, 140, 1),
                              ),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: SizedBox(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "주요 출연진",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          238, 238, 238, 1),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Center(
                                      child: SvgPicture.asset(
                                    "$baseAssetPath/user.svg",
                                    fit: BoxFit.fill,
                                    width: 24,
                                    height: 24,
                                    colorFilter: ColorFilter.mode(
                                        Color.fromRGBO(107, 107, 107, 1),
                                        BlendMode.srcIn),
                                  )),
                                )
                              ],
                            ),
                          )
                        ]),
                  ),
                )
              ],
            );
          }
        });
  }
}
