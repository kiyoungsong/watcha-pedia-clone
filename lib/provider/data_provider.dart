import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:watcha_pedia_clone/component/custom_text_field.dart';
import 'package:watcha_pedia_clone/model/keyword.dart';
import 'package:watcha_pedia_clone/service/keyworld_service.dart';

final keyworldDataProvider = FutureProvider<List<KeywordModel>>((ref) async {
  final searchText = ref.watch(searchTextProvider);
  return ref.watch(keyworldProvider).getKeywords(searchText);
});
