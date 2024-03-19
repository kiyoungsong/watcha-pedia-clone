import 'package:http/http.dart';
import 'package:watcha_pedia_clone/model/detail.dart';
import 'package:watcha_pedia_clone/model/image.dart';
import 'package:watcha_pedia_clone/model/similar.dart';
import 'package:watcha_pedia_clone/model/teaser.dart';
import 'package:watcha_pedia_clone/service/meta.dart';
import 'dart:convert';

class DetailService {
  Future<DetailModel> getDetail(int id) async {
    final detailResponse =
        await get(Uri.parse("$baseUrl/3/movie/$id"), headers: baseHeaders);

    final detailData = DetailModel.fromJson(json.decode(detailResponse.body));

    final etcResponse = await Future.wait([
      get(Uri.parse("$baseUrl/3/movie/$id/credits"), headers: baseHeaders),
      get(Uri.parse("$baseUrl/3/movie/$id/reviews"), headers: baseHeaders),
      get(Uri.parse("$baseUrl/3/movie/$id/images"), headers: baseHeaders),
      get(Uri.parse("$baseUrl/3/movie/$id/videos"), headers: baseHeaders),
      get(Uri.parse("$baseUrl/3/movie/$id/similar"), headers: baseHeaders),
    ]);

    for (int i = 0; i < etcResponse.length; i++) {
      switch (i) {
        case 0:
          detailData.cast =
              CastModel.fromJson(json.decode(etcResponse[i].body)["cast"]);
        case 1:
          detailData.review =
              ReviewModel.formJson(json.decode(etcResponse[i].body)["results"]);
        case 2:
          detailData.images = ImageModel.fromJson(
              json.decode(etcResponse[i].body)["backdrops"]);
        case 3:
          detailData.teasers =
              TeaserModel.formJson(json.decode(etcResponse[i].body)["results"]);
        case 4:
          detailData.similar = SimilarModel.fromJson(
              json.decode(etcResponse[i].body)["results"]);
      }
    }

    return detailData;
  }
}
