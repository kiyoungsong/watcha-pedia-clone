import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "홈"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "검색"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: "로그인"),
        ],
        currentIndex: _calculateSelectedIndex(context),
        onTap: (int index) => _onItemTapped(index, context));
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

// class Footer extends StatelessWidget {
//   const Footer({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double paddingPercentage = 0.24;
//     double padding = screenWidth * paddingPercentage;
//     return Container(
//         height: 56,
//         padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
//         decoration: BoxDecoration(
//             border: Border(
//                 top: BorderSide(
//                     color: Color.fromARGB(255, 210, 210, 210), width: 1.0))),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             FooterIcon(
//               title: "홈",
//               icon: Icons.home_outlined,
//               pathKey: ["movie", "tv"],
//               onClick: () => context.go("/movie"),
//             ),
//             FooterIcon(
//               title: "검색",
//               icon: Icons.search,
//               pathKey: ["search"],
//               onClick: () => context.go("/search"),
//             ),
//             FooterIcon(
//               title: "로그인",
//               icon: Icons.person_outline,
//               pathKey: ["login"],
//               onClick: () => context.go("/login"),
//             ),
//           ],
//         ));
//   }
// }
