import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:watcha_pedia_clone/component/text/custom_ellipsis_text.dart';
import 'package:watcha_pedia_clone/model/person.dart';
import 'package:watcha_pedia_clone/service/meta.dart';

class PersonDetailContent extends StatefulWidget {
  final PersonModel info;
  const PersonDetailContent({
    super.key,
    required this.info,
  });
  @override
  State<StatefulWidget> createState() => _PersonDetailContentState();
}

class _PersonDetailContentState extends State<PersonDetailContent> {
  ScrollController scrollController = ScrollController();
  bool _isTop = true;
  bool isOver = false;

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
        SliverStack(children: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 56,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 4),
                  child: Row(
                    children: [
                      getImage(widget.info.profilePath),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.info.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            widget.info.department,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: CustomEllipsisText(
                      text: widget.info.biography,
                      ellipsis: '... 더보기',
                    )),
                Text(widget.info.biography),
                const Text("하단6"),
                const Text("상단7"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
                const Text("상단"),
                const Text("하단"),
              ],
            ),
          ),
          SliverAppBar(
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
            title: _isTop
                ? null
                : Text(
                    widget.info.name,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
            flexibleSpace: _isTop
                ? null
                : Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromRGBO(0, 0, 0, 0.08),
                                width: 2.0)))),
            pinned: true,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            centerTitle: true,
          ),
        ])
      ],
    );
  }

  Widget getImage(String path) {
    if (path.isNotEmpty) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          "https://media.themoviedb.org/t/p/w185${widget.info.profilePath}",
          fit: BoxFit.fill,
          width: 84,
          height: 84,
        ),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        color: Colors.grey,
        width: 84,
        height: 84,
      ),
    );
  }
}
