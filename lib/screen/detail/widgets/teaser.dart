import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:watcha_pedia_clone/model/teaser.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

class DetailTeaser extends StatelessWidget {
  final List<TeaserModel> teasers;
  const DetailTeaser({super.key, required this.teasers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "동영상",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 14,
          ),
          SizedBox(
            height: 130,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: teasers.length,
              itemBuilder: (context, index) {
                String url =
                    "https://www.youtube.com/watch?v=${teasers[index].key}";
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(alignment: Alignment.center, children: [
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
                                Text(teasers[index].type)
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
    );
  }
}

String? getYoutubeThumbnail(String videoUrl) {
  final Uri? uri = Uri.tryParse(videoUrl);
  if (uri == null) {
    return null;
  }

  return 'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg';
}
