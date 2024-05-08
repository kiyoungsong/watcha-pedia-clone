import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:watcha_pedia_clone/component/scaffold/scaffold_with_header_nav.dart';
import 'package:watcha_pedia_clone/router/router_notifier.dart';
import 'package:watcha_pedia_clone/screen/comment/index.dart';
import 'package:watcha_pedia_clone/screen/comment_dtail/index.dart';
import 'package:watcha_pedia_clone/screen/detail/detail.dart';
import 'package:watcha_pedia_clone/screen/login.dart';
import 'package:watcha_pedia_clone/screen/movie.dart';
import 'package:watcha_pedia_clone/screen/person_detail/index.dart';
import 'package:watcha_pedia_clone/screen/search.dart';
import 'package:watcha_pedia_clone/screen/tv.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final routerProvider = Provider<GoRouter>((ref) {
  bool isDuplicate = false;
  final notifier = ref.read(goRouterNotifierProvider);
  return GoRouter(
      initialLocation: "/",
      // refreshListenable: notifier,
      // redirect: (context, state) {
      //   final isLoggedIn = notifier.isLoggedIn;
      //   final isGoingToLogin = state.uri.toString() == '/login';
      //   print("${isLoggedIn} ${isGoingToLogin} ${isDuplicate} ${state.uri}");
      //   if (!isLoggedIn && !isGoingToLogin && !isDuplicate) {
      //     isDuplicate = true;
      //     return '/login';
      //   }

      //   if (isLoggedIn && isGoingToLogin && !isDuplicate) {
      //     isDuplicate = true;
      //     return '/';
      //   }

      //   if (isDuplicate) {
      //     isDuplicate = false;
      //   }

      //   return null;
      // },
      navigatorKey: _rootNavigatorKey,
      routes: <RouteBase>[
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) => SaffoldWithHeaderNav(
                  child: child,
                ),
            routes: [
              GoRoute(
                path: "/",
                builder: (context, state) => MovieScreen(key: state.pageKey),
              ),
              GoRoute(
                  path: "/detail/:id",
                  builder: (context, state) => const DetailScreen()),
              GoRoute(
                path: "/tv",
                builder: (context, state) => TVScreen(key: state.pageKey),
              ),
              GoRoute(
                path: "/comments/:id",
                builder: (context, state) => const CommentScreen(),
              ),
              GoRoute(
                path: "/comments/detail/:id",
                builder: (context, state) => CommentDetailScreen(),
              ),
              GoRoute(
                path: "/person/detail/:id",
                builder: (context, state) => PersonDetailScreen(),
              ),
              GoRoute(
                path: "/search",
                builder: (context, state) => SearchScreen(key: state.pageKey),
              ),
              GoRoute(
                path: '/login',
                builder: (context, state) => LoginScreen(key: state.pageKey),
              ),
            ]),
      ]);
});
