import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:watcha_pedia_clone/service/meta.dart';
import 'package:watcha_pedia_clone/service/person_detail_service.dart';

class PersonDetailScreen extends StatefulWidget {
  @override
  State<PersonDetailScreen> createState() => _PersonDetailScreenState();
}

class _PersonDetailScreenState extends State<PersonDetailScreen> {
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
    final id = GoRouterState.of(context).pathParameters["id"] ?? "0";
    final item = PersonService().getDetail(int.parse(id));

    return FutureBuilder(
        future: item,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else {
            final info = snapshot.data!;
            return CustomScrollView(
              slivers: [
                SliverStack(children: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 56,
                        ),
                        Text(info.name),
                        Text(info.biography),
                        Text(info.department),
                        Text(info.profilePath),
                        Text("상단5"),
                        Text("하단6"),
                        Text("상단7"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
                        Text("상단"),
                        Text("하단"),
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
                                Color.fromRGBO(255, 47, 99, 1),
                                BlendMode.srcIn),
                          )),
                    ),
                    title: _isTop ? Text("배우명") : null,
                    flexibleSpace: Container(
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
        });
  }
}
