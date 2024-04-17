import 'package:http/http.dart';
import 'package:watcha_pedia_clone/model/detail.dart';
import 'package:watcha_pedia_clone/service/meta.dart';
import 'dart:convert';

class ReviewService {
  Future<List<ReviewModel>> getReview(int id) async {
    final reviewResponse = await get(Uri.parse("$baseUrl/3/movie/$id/reviews"),
        headers: baseHeaders);

    final reviews =
        ReviewModel.formJson(json.decode(reviewResponse.body)["results"]);

    return reviews;
  }
}
