import 'dart:convert';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart';
import 'package:watcha_pedia_clone/model/keyword.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

class KeyworldService {
  Future<List<KeywordModel>> getKeywords(String query) async {
    if (query != "") {
      Response response = await get(
          Uri.parse("$baseUrl/3/search/keyword?query=$query&page1"),
          headers: {
            'authorization': baseToken,
          });

      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body)['results'];
        return result.map((e) => KeywordModel.fromJson(e)).toList();
      }
    }

    return [];
  }
}

final keyworldProvider = Provider<KeyworldService>((ref) => KeyworldService());
