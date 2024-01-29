import 'package:flutter/material.dart';
import 'package:watcha_pedia_clone/component/main_app_bar.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(73),
        child: MainAppBar(),
      ),
      body: Text("Movie"),
    ));
  }
}
