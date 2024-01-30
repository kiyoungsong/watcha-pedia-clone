import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watcha_pedia_clone/component/footer_icon.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double paddingPercentage = 0.24;
    double padding = screenWidth * paddingPercentage;
    return Container(
        height: 56,
        padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    color: Color.fromARGB(255, 210, 210, 210), width: 1.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FooterIcon(
              title: "홈",
              icon: Icons.home_outlined,
              pathKey: ["movie", "tv"],
              onClick: () => context.go("/movie"),
            ),
            FooterIcon(
              title: "검색",
              icon: Icons.search,
              pathKey: ["search"],
              onClick: () => context.go("/search"),
            ),
            FooterIcon(
              title: "로그인",
              icon: Icons.person_outline,
              pathKey: ["login"],
              onClick: () => context.go("/login"),
            ),
          ],
        ));
  }
}
