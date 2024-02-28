import 'package:http/http.dart';
import 'package:watcha_pedia_clone/model/detail.dart';
import 'package:watcha_pedia_clone/service/meta.dart';
import 'dart:convert';

class DetailService {
  Future<DetailModel> getDetail(int id) async {
    final detailResponse = await get(
        Uri.parse("$baseUrl/3/movie/$id?language=ko-KR"),
        headers: baseHeaders);

    final detailData = DetailModel.fromJson(json.decode(detailResponse.body));

    final castResponse = await get(
        Uri.parse("$baseUrl/3/movie/$id/credits?language=ko-KR"),
        headers: baseHeaders);
    final castData = CastModel.fromJson(json.decode(castResponse.body)["cast"]);
    detailData.cast = castData;

    return detailData;
  }
}
