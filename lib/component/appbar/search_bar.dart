import 'package:flutter/material.dart';
import 'package:watcha_pedia_clone/component/custom_text_field.dart';

class SearchAppBar extends StatelessWidget {
  final void Function(BuildContext context) onClick;
  const SearchAppBar({required this.onClick, super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(68),
        child: Container(
          height: double.infinity,
          padding: const EdgeInsets.fromLTRB(15, 12, 15, 11),
          decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Color.fromARGB(255, 210, 210, 210), width: 1.0)),
          ),
          child: Row(children: [
            CustomTextField(),
            const SizedBox(
              width: 9,
            ),
            TextButton(
              onPressed: () => onClick(context),
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
