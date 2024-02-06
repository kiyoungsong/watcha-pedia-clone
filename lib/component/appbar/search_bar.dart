import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:watcha_pedia_clone/component/custom_text_field.dart';
import 'package:watcha_pedia_clone/theme/colors.dart';

class SearchAppBar extends ConsumerWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(68),
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.fromLTRB(15, 12, 15, 11),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: borderGray, width: 1.0)),
          ),
          child: Row(children: [
            CustomTextField(),
            const SizedBox(
              width: 9,
            ),
            TextButton(
              onPressed: () {
                ref.read(searchTextProvider.notifier).state = "";
                GoRouter.of(context).go("/");
              },
              child: const Text("취소",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 47, 110),
                      fontSize: 16,
                      height: 1)),
            )
          ]),
        ));
  }
}
