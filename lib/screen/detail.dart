import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:watcha_pedia_clone/component/comment_card.dart';
import 'package:watcha_pedia_clone/component/dialog/gallery.dart';
import 'package:watcha_pedia_clone/model/detail.dart';
import 'package:watcha_pedia_clone/service/detail_service.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  CarouselController controller = CarouselController();
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

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
                            if (info.tagline != "")
                              Text(
                                "\"${info.tagline}\"",
                                style: const TextStyle(
                                    color: Color.fromRGBO(140, 140, 140, 1)),
                              ),
                            if (info.tagline != "")
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: SizedBox(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "주요 출연진",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          getCarousel(info.cast, controller),
                        ]),
                  ),
                ),
                Padding(
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
                                    info.review.length.toString(),
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
                          children: getReviews(info.review),
                        ),
                      ),
                    ],
                  )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: SizedBox(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "갤러리",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          SizedBox(
                            height: 100,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: info.images.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    pageController =
                                        PageController(initialPage: index);
                                    return showDialog(
                                      context: context,
                                      builder: (context) {
                                        return GalleryDialog(
                                          controller: pageController,
                                          images: info.images,
                                        );
                                      },
                                    );
                                  },
                                  child: SizedBox(
                                    child: Row(children: [
                                      Image.network(
                                          "https://media.themoviedb.org/t/p/original${info.images[index].filePath}",
                                          width: 155,
                                          fit: BoxFit.fitWidth),
                                    ]),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 10,
                                );
                              },
                            ),
                          ),
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "동영상",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      SizedBox(
                        height: 130,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: info.teasers.length,
                          itemBuilder: (context, index) {
                            String url =
                                "https://www.youtube.com/watch?v=${info.teasers[index].key}";
                            String? thumbnail = getYoutubeThumbnail(url);
                            return GestureDetector(
                              onTap: () async {
                                // 링크
                                Uri uri = Uri.parse(url);
                                if (!await launchUrl(uri)) {
                                  throw "링크로 이동할 수 없음";
                                }
                              },
                              child: SizedBox(
                                  child: thumbnail != null
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Image.network(thumbnail,
                                                      height: 100,
                                                      width: 155,
                                                      fit: BoxFit.fitWidth),
                                                  SvgPicture.asset(
                                                    "$baseAssetPath/player.svg",
                                                    fit: BoxFit.fill,
                                                    width: 24,
                                                    height: 24,
                                                  )
                                                ]),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(info.teasers[index].type)
                                          ],
                                        )
                                      : null),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "추천작품",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 24,
                                crossAxisSpacing: 13,
                                childAspectRatio: 0.45),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                    "https://media.themoviedb.org/t/p/original${info.similar[index].poster}",
                                    fit: BoxFit.fitWidth),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  info.similar[index].title,
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
                                          color:
                                              Color.fromRGBO(85, 87, 101, 1))),
                                  const WidgetSpan(
                                      child: Icon(
                                    Icons.star,
                                    size: 15,
                                  )),
                                  TextSpan(
                                      text: info.similar[index].voteAverage
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          height: 1.07,
                                          color:
                                              Color.fromRGBO(85, 87, 101, 1))),
                                ])),
                                Text(DateFormat('yyyy-MM-dd')
                                    .format(info.similar[index].releaseDate))
                              ],
                            ),
                          );
                        },
                        itemCount: info.similar.length,
                      )
                    ],
                  ),
                )
              ],
            );
          }
        });
  }
}

Widget getCarousel(List<CastModel> list, CarouselController controller) {
  List<Widget> credits = getCredits(list);
  return SizedBox(
    height: 228,
    child: CarouselSlider(
        carouselController: controller,
        items: credits,
        options: CarouselOptions(
            enableInfiniteScroll: false, height: 228, viewportFraction: 1)),
  );
}

Widget getCredit(CastModel? item, bool isBorder) {
  return item != null
      ? SizedBox(
          height: 76,
          child: Row(
            children: [
              item.profilePath != null
                  ? SizedBox(
                      width: 56,
                      height: 56,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                            "https://media.themoviedb.org/t/p/original${item.profilePath}",
                            fit: BoxFit.fill),
                      ),
                    )
                  : Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(238, 238, 238, 1),
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                          child: SvgPicture.asset(
                        "$baseAssetPath/user.svg",
                        fit: BoxFit.fill,
                        width: 24,
                        height: 24,
                        colorFilter: const ColorFilter.mode(
                            Color.fromRGBO(107, 107, 107, 1), BlendMode.srcIn),
                      )),
                    ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    border: BorderDirectional(
                        bottom: BorderSide(
                            color: Color.fromRGBO(0, 0, 0, 0.08),
                            style: isBorder
                                ? BorderStyle.solid
                                : BorderStyle.none))),
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            item.name,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            item.character,
                            style: const TextStyle(
                                color: Color.fromRGBO(140, 140, 140, 1)),
                          ),
                        ])),
              )),
            ],
          ),
        )
      : const SizedBox();
}

List<Widget> getCredits(List<CastModel> list) {
  // 여기서 3개씩 묶어서 넘기자!
  List<Widget> result = [];

  for (int i = 0; i < list.length; i += 3) {
    bool isLast = !(i + 1 < list.length) && !(i + 2 < list.length);
    bool isSecondLast = !(i + 2 < list.length);
    result.add(Column(
      children: [
        getCredit(list[i], isLast ? false : true),
        getCredit(i + 1 < list.length ? list[i + 1] : null,
            isSecondLast ? false : true),
        getCredit(i + 2 < list.length ? list[i + 2] : null, false)
      ],
    ));
  }
  return result;
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

List<Widget> getImages(List<dynamic> list) {
  List<Widget> result = [];

  return result;
}

String? getYoutubeThumbnail(String videoUrl) {
  final Uri? uri = Uri.tryParse(videoUrl);
  if (uri == null) {
    return null;
  }

  return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
}
