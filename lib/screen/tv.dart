import 'package:flutter/material.dart';
import 'package:watcha_pedia_clone/component/main_app_bar.dart';

class TVScreen extends StatelessWidget {
  const TVScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(73),
        child: MainAppBar(),
      ),
      body: Text("TV"),
    ));
  }
}
