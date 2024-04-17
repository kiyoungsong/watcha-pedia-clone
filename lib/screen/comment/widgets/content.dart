import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:watcha_pedia_clone/component/comment_card.dart';
import 'package:watcha_pedia_clone/model/detail.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

class CommentContent extends StatefulWidget {
  final List<ReviewModel> review;

  const CommentContent({super.key, required this.review});
  @override
  State<CommentContent> createState() => _CommentContentState();
}

class _CommentContentState extends State<CommentContent> {
  ScrollController scrollController = ScrollController();
  bool _isTop = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(handleScrollEvent);
  }

  void handleScrollEvent() {
    final isTop = scrollController.offset < 50;
    if (isTop != _isTop) {
      setState(() {
        _isTop = isTop;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(handleScrollEvent);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          bottom: _isTop
              ? const PreferredSize(
                  preferredSize: Size.fromHeight(0.0),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15, bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "코멘트",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                  ))
              : null,
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color.fromRGBO(0, 0, 0, 0.08), width: 2.0)))),
          pinned: true,
          backgroundColor: Colors.white,
          toolbarHeight: _isTop ? 91 : 45,
          centerTitle: true,
          title: _isTop
              ? null
              : const Text(
                  "코멘트",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
          leading: SizedBox(
            height: 24,
            width: 24,
            child: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  if (GoRouter.of(context).canPop()) {
                    GoRouter.of(context).pop();
                  }
                },
                icon: SvgPicture.asset(
                  "$baseAssetPath/arrow_left.svg",
                  colorFilter: const ColorFilter.mode(
                      Color.fromRGBO(255, 47, 99, 1), BlendMode.srcIn),
                )),
          ),
        ),
        SliverStack(children: [
          SliverToBoxAdapter(
            child: Column(
              children: getReviews(widget.review),
            ),
          )
        ]),
      ],
    );
  }
}

List<Widget> getReviews(List<ReviewModel> list) {
  List<Widget> result = [];

  for (int i = 0; i < list.length; i++) {
    if (i == 0) {
      result.add(const SizedBox(
        height: 20,
      ));
    }
    result.add(CommentCard(
        id: list[i].id,
        detailModel: list[i].authorDetailModel,
        content: list[i].content,
        createdAt: list[i].createdAt));
    result.add(const SizedBox(
      height: 20,
    ));
  }
  return result;
}
