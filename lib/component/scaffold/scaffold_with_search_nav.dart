import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watcha_pedia_clone/component/appbar/search_bar.dart';
import 'package:watcha_pedia_clone/component/footer/footer.dart';

class SaffoldWithSearchNav extends StatelessWidget {
  final Widget child;
  const SaffoldWithSearchNav({required this.child, super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(73),
        child: SearchAppBar(
          onClick: onClick,
        ),
      ),
      body: child,
      bottomNavigationBar: const Footer(),
    ));
  }

  void onClick(BuildContext context) {
    GoRouter.of(context).go("/");
  }
}
