import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    String currentUrl = GoRouterState.of(context).uri.toString();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: double.infinity,
          padding: EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Row(
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    context.go("/movie");
                  },
                  child: Text(
                    "영화",
                    style: getStyle(currentUrl, "movie"),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 2,
                height: 16,
                color: Color.fromARGB(255, 209, 209, 210),
              ),
              const SizedBox(
                width: 10,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    context.go("/tv");
                  },
                  child: Text(
                    "TV",
                    style: getStyle(currentUrl, "tv"),
                  ),
                ),
              )
            ],
          )),
    );
  }

  TextStyle getStyle(String url, String key) {
    const TextStyle commonStyle = TextStyle(
        color: Color.fromARGB(255, 165, 165, 170),
        fontWeight: FontWeight.bold,
        fontSize: 27,
        height: 1);

    return url.contains(key)
        ? commonStyle.copyWith(color: Colors.black)
        : commonStyle;
  }
}
