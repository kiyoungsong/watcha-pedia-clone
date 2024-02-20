import 'dart:convert';

import 'package:http/http.dart';
import 'package:watcha_pedia_clone/model/video.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

class TVListService {
  Future<Map<KeyEnum, List<VideoModel>>> getTVList() async {
    final response = await Future.wait([
      get(Uri.parse("$baseUrl/3/tv/airing_today"), headers: baseHeaders),
      get(Uri.parse("$baseUrl/3/tv/on_the_air"), headers: baseHeaders),
      get(Uri.parse("$baseUrl/3/tv/popular"), headers: baseHeaders),
      get(Uri.parse("$baseUrl/3/tv/top_rated"), headers: baseHeaders)
    ]);
    Map<KeyEnum, List<VideoModel>> list = {
      KeyEnum.airingToday: [],
      KeyEnum.popular: [],
      KeyEnum.topRated: [],
      KeyEnum.onTheAir: [],
    };

    for (int i = 0; i < response.length; i++) {
      final List result = jsonDecode(response[i].body)['results'];
      KeyEnum keys;
      switch (i) {
        case 0:
          keys = KeyEnum.airingToday;
          break;
        case 1:
          keys = KeyEnum.onTheAir;
          break;
        case 2:
          keys = KeyEnum.popular;
          break;
        case 3:
          keys = KeyEnum.topRated;
          break;
        default:
          keys = KeyEnum.airingToday; // 기본값으로 airingToday 사용합니다.
      }

      list[keys] = result.map((e) => VideoModel.fromJson(e)).toList();
    }

    return list;
  }
}
