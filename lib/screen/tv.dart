import 'package:flutter/material.dart';
import 'package:watcha_pedia_clone/component/box_slider.dart';
import 'package:watcha_pedia_clone/model/video.dart';
import 'package:watcha_pedia_clone/service/meta.dart';
import 'package:watcha_pedia_clone/service/tv_list_service.dart';

class TVScreen extends StatefulWidget {
  const TVScreen({super.key});

  @override
  State<TVScreen> createState() => _TVScreenState();
}

class _TVScreenState extends State<TVScreen> {
  late Future<Map<KeyEnum, List<VideoModel>>> tvList;

  @override
  void initState() {
    super.initState();
    tvList = TVListService().getTVList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: tvList,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          Map<KeyEnum, List<VideoModel>> list = snapshot.data!;
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            children: <Widget>[
              BoxSlider(
                list: list[KeyEnum.airingToday] ?? [],
                keyword: KeyEnum.airingToday,
              ),
              BoxSlider(
                list: list[KeyEnum.onTheAir] ?? [],
                keyword: KeyEnum.onTheAir,
              ),
              BoxSlider(
                list: list[KeyEnum.popular] ?? [],
                keyword: KeyEnum.popular,
              ),
              BoxSlider(
                list: list[KeyEnum.topRated] ?? [],
                keyword: KeyEnum.topRated,
              )
            ],
          );
        }
      },
    );
  }
}
