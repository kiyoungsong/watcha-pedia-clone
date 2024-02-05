import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watcha_pedia_clone/component/scaffold/scaffold_with_header_nav.dart';
import 'package:watcha_pedia_clone/component/scaffold/scaffold_with_search_nav.dart';
import 'package:watcha_pedia_clone/screen/movie.dart';
import 'package:watcha_pedia_clone/screen/search.dart';
import 'package:watcha_pedia_clone/screen/tv.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter _router = GoRouter(
    initialLocation: "/",
    navigatorKey: _rootNavigatorKey,
    routes: <RouteBase>[
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) => SaffoldWithHeaderNav(
                child: child,
              ),
          routes: [
            GoRoute(
                path: "/", builder: (context, state) => const MovieScreen()),
            GoRoute(
              path: "/tv",
              builder: (context, state) => const TVScreen(),
            )
          ]),
      ShellRoute(
          builder: (context, state, child) =>
              SaffoldWithSearchNav(child: child),
          routes: <RouteBase>[
            GoRoute(
              path: "/search",
              builder: (context, state) => const SearchScreen(),
            )
          ])
    ]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
