import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watcha_pedia_clone/component/appbar/main_bar.dart';
import 'package:watcha_pedia_clone/component/appbar/search_bar.dart';
import 'package:watcha_pedia_clone/component/footer/footer.dart';

class SaffoldWithHeaderNav extends StatelessWidget {
  final Widget child;
  const SaffoldWithHeaderNav({required this.child, super.key});
  @override
  Widget build(BuildContext context) {
    final bool isSearched =
        GoRouterState.of(context).uri.toString() == "/search";
    final bool isDetail =
        GoRouterState.of(context).uri.toString().contains("detail");
    return SafeArea(
        child: Scaffold(
      appBar: isDetail
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(73),
              child: isSearched ? const SearchAppBar() : const MainBar(),
            ),
      body: child,
      bottomNavigationBar: const Footer(),
    ));
  }
}
