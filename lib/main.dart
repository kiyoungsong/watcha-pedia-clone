import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:watcha_pedia_clone/component/main_app_bar.dart';
import 'package:watcha_pedia_clone/screen/movie.dart';
import 'package:watcha_pedia_clone/screen/tv.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router =
    GoRouter(initialLocation: "/movie", routes: <RouteBase>[
  GoRoute(
    path: "/movie",
    builder: (context, state) => const MovieScreen(),
  ),
  GoRoute(
    path: "/tv",
    builder: (context, state) => const TVScreen(),
  ),
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
