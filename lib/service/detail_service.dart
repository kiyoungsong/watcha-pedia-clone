import 'package:http/http.dart';
import 'package:watcha_pedia_clone/model/detail.dart';
import 'package:watcha_pedia_clone/service/meta.dart';
import 'dart:convert';

class DetailService {
  Future<DetailModel> getDetail(int id) async {
    final response = await get(Uri.parse("$baseUrl/3/movie/$id?language=ko-KR"),
        headers: baseHeaders);

    return DetailModel.fromJson(json.decode(response.body));
  }
}
