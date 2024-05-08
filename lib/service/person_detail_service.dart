import 'dart:convert';

import 'package:http/http.dart';
import 'package:watcha_pedia_clone/model/person.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

class PersonService {
  Future<PersonModel> getDetail(int id) async {
    final detailResponse =
        await get(Uri.parse("$baseUrl/3/person/$id"), headers: baseHeaders);

    final detailData = PersonModel.fromJson(json.decode(detailResponse.body));
    // 작품 가져오는 API 추가해야함.

    print(detailData.name);

    return detailData;
  }
}
