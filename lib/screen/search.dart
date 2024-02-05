import 'package:flutter/material.dart';
import 'package:watcha_pedia_clone/component/custom_text_field.dart';
import 'package:watcha_pedia_clone/component/footer/footer.dart';

class SearchScreen extends StatelessWidget {
  final VoidCallback? onClick;

  const SearchScreen({this.onClick, super.key});
  @override
  Widget build(BuildContext context) {
    return Text("Search");
  }
}
