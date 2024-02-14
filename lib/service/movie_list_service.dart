import 'dart:convert';

import 'package:http/http.dart';
import 'package:watcha_pedia_clone/model/movie.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

enum KeyEnum { nowPlaying, popular, topRated, upcoming }

class MovieListService {
  Future<Map<KeyEnum, List<MovieModel>>> getMovieList() async {
    final response = await Future.wait([
      get(Uri.parse("$baseUrl/3/movie/now_playing"), headers: baseHeaders),
      get(Uri.parse("$baseUrl/3/movie/popular"), headers: baseHeaders)
    ]);
    Map<KeyEnum, List<MovieModel>> list = {
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

      list[keys] = result.map((e) => MovieModel.fromJson(e)).toList();
    }

    return list;
  }
}
