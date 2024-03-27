import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key});

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  ScrollController _scrollController = ScrollController();
  bool isTop = true;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      scrollListener();
    });
  }

  scrollListener() async {
    if (_scrollController.offset ==
            _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        isTop = true;
      });
    } else {
      setState(() {
        isTop = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final id = GoRouterState.of(context).pathParameters["id"] ?? "0";
    return Container(
      child: SizedBox(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: isTop
                  ? Container(
                      height: 85,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(227, 227, 227, 1)))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SvgPicture.asset(
                              "$baseAssetPath/arrow_left.svg",
                              height: 24,
                              width: 24,
                              colorFilter: const ColorFilter.mode(
                                  Color.fromRGBO(255, 47, 99, 1),
                                  BlendMode.srcIn),
                            ),
                          ),
                          const Text(
                            "코멘트",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                height: 1),
                          )
                        ],
                      ),
                    )
                  : Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(227, 227, 227, 1)))),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SvgPicture.asset(
                              "$baseAssetPath/arrow_left.svg",
                              height: 24,
                              width: 24,
                              colorFilter: const ColorFilter.mode(
                                  Color.fromRGBO(255, 47, 99, 1),
                                  BlendMode.srcIn),
                            ),
                          ),
                          const Center(
                            child: Text(
                              "코멘트",
                              style: TextStyle(
                                  fontSize: 17,
                                  height: 1,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
            ),
            Expanded(
                child: ListView(controller: _scrollController, children: [
              Text("10"),
              Text("10"),
              Text("10"),
              Text("10"),
              Text("10"),
              Text("10"),
              Text("10"),
              Text("10"),
              Text("10"),
              Text("10"),
              Text("10"),
              Text("10"),
              Text("10"),
              Text("10"),
              Text("10"),
              Text("10"),
              Text("10"),
            ]))
          ],
        ),
      ),
    );
  }
}
