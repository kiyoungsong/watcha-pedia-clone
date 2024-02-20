import 'dart:convert';

import 'package:http/http.dart';
import 'package:watcha_pedia_clone/model/video.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

class MovieListService {
  Future<Map<KeyEnum, List<VideoModel>>> getMovieList() async {
    final response = await Future.wait([
      get(Uri.parse("$baseUrl/3/movie/now_playing"), headers: baseHeaders),
      get(Uri.parse("$baseUrl/3/movie/popular"), headers: baseHeaders),
      get(Uri.parse("$baseUrl/3/movie/top_rated"), headers: baseHeaders),
      get(Uri.parse("$baseUrl/3/movie/upcoming"), headers: baseHeaders)
    ]);
    Map<KeyEnum, List<VideoModel>> list = {
      KeyEnum.nowPlaying: [],
      KeyEnum.popular: [],
      KeyEnum.topRated: [],
      KeyEnum.upcoming: [],
    };

    for (int i = 0; i < response.length; i++) {
      final List result = jsonDecode(response[i].body)['results'];
      KeyEnum keys;
      switch (i) {
        case 0:
          keys = KeyEnum.nowPlaying;
          break;
        case 1:
          keys = KeyEnum.popular;
          break;
        case 2:
          keys = KeyEnum.topRated;
          break;
        case 3:
          keys = KeyEnum.upcoming;
          break;
        default:
          keys = KeyEnum.nowPlaying; // 기본값으로 nowPlaying을 사용합니다.
      }

      list[keys] = result.map((e) => VideoModel.fromJson(e)).toList();
    }

    return list;
  }
}
