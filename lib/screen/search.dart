import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:watcha_pedia_clone/provider/data_provider.dart';
import 'package:watcha_pedia_clone/model/keyword.dart';

class SearchScreen extends ConsumerWidget {
  final VoidCallback? onClick;

  const SearchScreen({this.onClick, super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchList = ref.watch(keyworldDataProvider);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: searchList.when(
          data: (searchList) {
            List<KeywordModel> result = searchList.map((e) => e).toList();
            if (result.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "연관 검색어",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                      child: ListView.builder(
                    itemCount: result.length,
                    itemBuilder: (_, index) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color.fromRGBO(0, 0, 0, 0.08),
                                    width: 1.0))),
                        child: Text(
                          result[index].name,
                          style: const TextStyle(fontSize: 16),
                        ),
                      );
                    },
                  )),
                ],
              );
            } else {
              return null;
            }
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
