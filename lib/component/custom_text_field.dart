import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatefulWidget {
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: 44,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(9, 12, 17, 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Color.fromARGB(255, 245, 245, 245)),
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/search.svg"),
          SizedBox(width: 9),
          Expanded(
              child: TextField(
            controller: _controller,
            decoration: InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide.none),
                hintText: "콘텐츠, 인물, 컬렉션을 검색해주세요.",
                hintStyle:
                    TextStyle(color: Color.fromARGB(255, 160, 160, 160))),
          )),
        ],
      ),
    ));
  }
}
