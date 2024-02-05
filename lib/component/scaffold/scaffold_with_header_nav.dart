import 'package:flutter/material.dart';
import 'package:watcha_pedia_clone/component/appbar/main_bar.dart';
import 'package:watcha_pedia_clone/component/footer/footer.dart';

class SaffoldWithHeaderNav extends StatelessWidget {
  final Widget child;
  const SaffoldWithHeaderNav({required this.child, super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(73),
        child: MainBar(),
      ),
      body: child,
      bottomNavigationBar: const Footer(),
    ));
  }
}
