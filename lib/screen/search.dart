import 'package:flutter/material.dart';
import 'package:watcha_pedia_clone/component/custom_text_field.dart';
import 'package:watcha_pedia_clone/component/footer.dart';

class SearchScreen extends StatelessWidget {
  final VoidCallback? onClick;

  const SearchScreen({this.onClick, super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(68),
          child: Container(
            height: double.infinity,
            padding: EdgeInsets.fromLTRB(15, 12, 15, 11),
            child: Row(children: [
              CustomTextField(),
              SizedBox(
                width: 9,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: onClick,
                  child: Text("취소",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 47, 110),
                          fontSize: 16,
                          height: 1)),
                ),
              )
            ]),
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Color.fromARGB(255, 210, 210, 210), width: 1.0)),
            ),
          )),
      bottomNavigationBar: Footer(),
    );
  }
}
