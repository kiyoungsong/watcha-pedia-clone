import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:watcha_pedia_clone/service/meta.dart';
import 'package:watcha_pedia_clone/theme/colors.dart';

class Footer extends StatelessWidget {
  final int currentPageIndex = 0;
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = _calculateSelectedIndex(context);
    return Container(
      height: 56,
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: borderGray))),
      child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          selectedItemColor: Colors.black,
          unselectedFontSize: 11.5,
          selectedFontSize: 11.5,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: getIcon("home", currentIndex == 0), label: "홈"),
            BottomNavigationBarItem(
                icon: getIcon("search", currentIndex == 1), label: "검색"),
            BottomNavigationBarItem(
                icon: getIcon("user", currentIndex == 2), label: "로그인"),
          ],
          currentIndex: currentIndex,
          onTap: (int index) => _onItemTapped(index, context)),
    );
  }

  Widget getIcon(String key, bool selected) {
    return Container(
      padding: const EdgeInsets.only(bottom: 3),
      width: 24,
      child: SvgPicture.asset(
        "$baseAssetPath/$key.svg",
        colorFilter: ColorFilter.mode(
            selected ? Colors.black : baseGray, BlendMode.srcIn),
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    if (location == "/login") {
      return 2;
    }

    if (location == "/search") {
      return 1;
    }

    if (location == "/") {
      return 0;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/');
      case 1:
        GoRouter.of(context).go('/search');
      case 2:
        GoRouter.of(context).go('/login');
    }
  }
}
