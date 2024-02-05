import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:watcha_pedia_clone/theme/colors.dart';

class Footer extends StatelessWidget {
  final int currentPageIndex = 0;
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration:
          BoxDecoration(border: Border(top: BorderSide(color: borderGray))),
      child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          selectedItemColor: Colors.black,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedFontSize: 11.5,
          selectedFontSize: 11.5,
          unselectedItemColor: baseGray,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: getIcon("home"), label: "홈"),
            BottomNavigationBarItem(icon: getIcon("search"), label: "검색"),
            BottomNavigationBarItem(icon: getIcon("user"), label: "로그인"),
          ],
          currentIndex: _calculateSelectedIndex(context),
          onTap: (int index) => _onItemTapped(index, context)),
    );
  }

  Widget getIcon(String key) {
    String basePath = "assets/icons";
    return Container(
      padding: EdgeInsets.only(bottom: 3),
      width: 24,
      child: SvgPicture.asset("$basePath/$key.svg"),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith("/")) {
      return 0;
    }

    if (location.startsWith("/search")) {
      return 1;
    }

    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/');
      case 1:
        GoRouter.of(context).go('/search');
    }
  }
}
