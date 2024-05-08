import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:watcha_pedia_clone/model/detail.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

class DetailCredit extends StatefulWidget {
  final List<CastModel> cast;
  const DetailCredit({super.key, required this.cast});

  @override
  State<DetailCredit> createState() => _DetailCreditState();
}

class _DetailCreditState extends State<DetailCredit> {
  CarouselController controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: SizedBox(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "주요 출연진",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          getCarousel(widget.cast, controller, context),
        ]),
      ),
    );
  }
}

Widget getCarousel(
    List<CastModel> list, CarouselController controller, BuildContext context) {
  List<Widget> credits = getCredits(list, context);
  return SizedBox(
    height: 264,
    child: CarouselSlider(
        carouselController: controller,
        items: credits,
        options: CarouselOptions(
            enableInfiniteScroll: false, height: 264, viewportFraction: 1)),
  );
}

Widget getCredit(CastModel? item, bool isBorder, BuildContext context) {
  return item != null
      ? GestureDetector(
          onTap: () {
            GoRouter.of(context).push("/person/detail/${item.id}");
          },
          child: SizedBox(
            height: 85,
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
                              Color.fromRGBO(107, 107, 107, 1),
                              BlendMode.srcIn),
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
                              color: const Color.fromRGBO(0, 0, 0, 0.08),
                              style: isBorder
                                  ? BorderStyle.solid
                                  : BorderStyle.none))),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
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
          ),
        )
      : const SizedBox();
}

List<Widget> getCredits(List<CastModel> list, BuildContext context) {
  // 여기서 3개씩 묶어서 넘기자!
  List<Widget> result = [];

  for (int i = 0; i < list.length; i += 3) {
    bool isLast = !(i + 1 < list.length) && !(i + 2 < list.length);
    bool isSecondLast = !(i + 2 < list.length);
    result.add(Column(
      children: [
        getCredit(list[i], isLast ? false : true, context),
        getCredit(i + 1 < list.length ? list[i + 1] : null,
            isSecondLast ? false : true, context),
        getCredit(i + 2 < list.length ? list[i + 2] : null, false, context)
      ],
    ));
  }
  return result;
}
