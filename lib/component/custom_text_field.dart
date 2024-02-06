import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final searchTextProvider = StateProvider((ref) => '');

class CustomTextField extends ConsumerWidget {
  final controller = TextEditingController();
  CustomTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchText = ref.watch(searchTextProvider);
    return Expanded(
        child: Container(
      height: 44,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(9, 12, 17, 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color.fromARGB(255, 245, 245, 245)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/icons/search.svg"),
          const SizedBox(width: 9),
          Expanded(
              child: TextField(
            onChanged: (value) {
              ref.read(searchTextProvider.notifier).state = value;
            },
            controller: controller,
            decoration: InputDecoration(
                border: const UnderlineInputBorder(borderSide: BorderSide.none),
                hintText: "콘텐츠, 인물, 컬렉션을 검색해주세요.",
                hintStyle:
                    const TextStyle(color: Color.fromARGB(255, 160, 160, 160)),
                suffixIcon: searchText != ""
                    ? IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          controller.clear();
                        },
                        icon: const Icon(
                          Icons.cancel,
                          color: Color.fromARGB(255, 160, 160, 160),
                        ),
                        iconSize: 20,
                      )
                    : null),
          )),
        ],
      ),
    ));
  }
}
